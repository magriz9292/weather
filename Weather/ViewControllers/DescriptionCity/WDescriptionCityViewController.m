//
//  WDescriptionCityViewController.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WDescriptionCityViewController.h"
#import "WDescriptionCityDataCollector.h"

@interface WDescriptionCityViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) WDescriptionCityDataCollector *dataCollector;

@end

@implementation WDescriptionCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.weatherCity.cityName;
    
    UITableView *tableView = self.tableView;
    self.dataCollector.tableView = tableView;
    tableView.tableFooterView = [UIView new];
}

#pragma mark - setters

- (void)setWeatherCity:(WWeatherCity *)weatherCity{
    _weatherCity = weatherCity;
    self.dataCollector.weatherCity = weatherCity;
}

#pragma mark - getters

- (WDescriptionCityDataCollector *)dataCollector{
    if (!_dataCollector){
        _dataCollector = [WDescriptionCityDataCollector new];
    }
    return _dataCollector;
}

@end
