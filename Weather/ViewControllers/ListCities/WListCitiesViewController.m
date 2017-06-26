//
//  WListCitiesViewController.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WListCitiesViewController.h"
#import "WDataManager.h"
#import "WDescriptionCityViewController.h"
#import "WListCitiesTableViewCell.h"
#import <MBProgressHUD/MBProgressHUD.h>

static NSString *kListCitiesToDescriptionCitySegueID = @"ListCitiesToDescriptionCitySegueID";
static NSString *kWListCitiesViewControllerCellIdentifier = @"WListCitiesTableViewCellID";


@interface WListCitiesViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, WDataManagerDelegate, WListCitiesTableViewCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, strong) WDataManager *dataManager;
@property (nonatomic, strong) NSArray<WWeatherCity*> *arrayModels;
@property (nonatomic, strong) WWeatherCity *selectWeatherCity;

@end

@implementation WListCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Weather", nil);
    
    WDataManager *dataManager = [WDataManager new];
    self.dataManager = dataManager;
    dataManager.delegate = self;
    self.arrayModels = [dataManager getCitiesWeather];
    
    UITableView *tableView = self.tableView;
    tableView.tableFooterView = [UIView new];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    self.refreshControl = refreshControl;
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    
    [tableView addSubview:refreshControl];
    
    [tableView registerClass:[WListCitiesTableViewCell class] forCellReuseIdentifier:kWListCitiesViewControllerCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - WDataManagerDelegate

- (void)dataManager:(WDataManager*)sender reloadArrayModels:(NSArray <WWeatherCity*> *)arrayModels{
    self.arrayModels = arrayModels;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)dataManager:(WDataManager *)sender errorWithDescription:(NSString *)string{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error",nil) message:string preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok",nil) style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WListCitiesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWListCitiesViewControllerCellIdentifier forIndexPath:indexPath];
    WWeatherCity *weatherCity = self.arrayModels[indexPath.row];
    cell.titleString = weatherCity.cityName;
    cell.descriptionString = [NSString stringWithFormat:@"%i °C", (int)weatherCity.list.firstObject.main.temp];
    cell.index = indexPath.row;
    cell.delegate = self;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.searchBar resignFirstResponder];
    self.selectWeatherCity = self.arrayModels[indexPath.row];
    [self performSegueWithIdentifier:kListCitiesToDescriptionCitySegueID sender:self];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.dataManager loadCityWeather:searchBar.text];
    searchBar.text = nil;
    [searchBar resignFirstResponder];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:kListCitiesToDescriptionCitySegueID]){
        WDescriptionCityViewController *viewController = [segue destinationViewController];
        viewController.weatherCity = self.selectWeatherCity;
        self.selectWeatherCity = nil;
    }
}

#pragma mark - WListCitiesTableViewCellDelegate

- (void)pressDeleteButtonWithIndex:(NSUInteger)index{
    WWeatherCity *weatherCity = self.arrayModels[index];
    [self.dataManager removeModel:weatherCity];
}

#pragma mark - actions

- (void)reloadData{
    [self.dataManager reloadData];
}

#pragma mark - KeyboardNotifications

- (void)keyboardShow:(NSNotification*)notification{
    self.bottomConstraint.constant = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    [self.view layoutIfNeeded];
}

- (void)keyboardHide:(NSNotification*)notification{
    self.bottomConstraint.constant = 0;
    [self.view layoutIfNeeded];
}

@end
