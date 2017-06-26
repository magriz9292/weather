//
//  WDescriptionCityDataCollector.m
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WDescriptionCityDataCollector.h"
#import "WDescriptionCityViewModel.h"
#import "WDescriptionCityTableViewCell.h"

static NSString *kWDescriptionCityDataCollectorCellIdentifier = @"WDescriptionCityTableViewCellID";

@interface WDescriptionCityDataCollector()<UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSArray<WDescriptionCityViewModel*>*> *viewModels;

@end

@implementation WDescriptionCityDataCollector

#pragma mark - setters

- (void)setWeatherCity:(WWeatherCity *)weatherCity{
    _weatherCity = weatherCity;
    
    NSMutableArray<WWeatherDescriptionDay*> *mList = [NSMutableArray arrayWithArray:weatherCity.list];
    
    NSUInteger currentIndex = 0;
    
    for (NSUInteger i = 0; i < mList.count; i++){
        WWeatherDescriptionDay *weatherDescriptionDay = mList[i];
        NSDate *date = weatherDescriptionDay.date;
        if ([date laterDate:[NSDate date]] == date){
            currentIndex = i;
            break;
        }
    }
    
    WWeatherDescriptionDay *currentWeatherDescription = mList[currentIndex];
    [mList removeObjectsInRange:NSMakeRange(0, currentIndex + 1)];
    
    NSMutableArray<WWeatherDescriptionDay*> *mNextDaysWeather = [NSMutableArray new];
    NSDate *lastDate = currentWeatherDescription.date;
    for (WWeatherDescriptionDay *weatherDescriptionDay in mList){
        NSDate *nextDate = [NSDate dateWithTimeInterval:60 * 60 * 24 sinceDate:lastDate];
        if ([nextDate earlierDate:weatherDescriptionDay.date] == nextDate){
            lastDate = nextDate;
            [mNextDaysWeather addObject:weatherDescriptionDay];
        }
    }
    
    NSMutableArray<NSArray<WDescriptionCityViewModel*>*> *mViewModels = [NSMutableArray new];
    
    NSMutableArray<WDescriptionCityViewModel*> *mArrayFirstSection = [NSMutableArray new];
    
    WWeatherMain *weatherMain = currentWeatherDescription.main;
    
    WDescriptionCityViewModel *viewModel = [WDescriptionCityViewModel new];
    viewModel.titleString = NSLocalizedString(@"Temp",nil);
    viewModel.descriptionString = [NSString stringWithFormat:@"%i °C", (int)weatherMain.temp];
    [mArrayFirstSection addObject:viewModel];
    
    viewModel = [WDescriptionCityViewModel new];
    viewModel.titleString = NSLocalizedString(@"Humidity",nil);
    viewModel.descriptionString = [NSString stringWithFormat:@"%i", (int)weatherMain.humidity];
    [mArrayFirstSection addObject:viewModel];
    
    viewModel = [WDescriptionCityViewModel new];
    viewModel.titleString = NSLocalizedString(@"Pressure",nil);
    viewModel.descriptionString = [NSString stringWithFormat:@"%i", (int)weatherMain.pressure];
    [mArrayFirstSection addObject:viewModel];
    
    viewModel = [WDescriptionCityViewModel new];
    viewModel.titleString = NSLocalizedString(@"Speed wind",nil);
    viewModel.descriptionString = [NSString stringWithFormat:@"%i", (int)currentWeatherDescription.wind.speed];
    [mArrayFirstSection addObject:viewModel];
    
    [mViewModels addObject:[NSArray arrayWithArray:mArrayFirstSection]];
    
    NSMutableArray<WDescriptionCityViewModel*> *mArraySecondSection = [NSMutableArray new];
    
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"d MMMM"];
    
    for (WWeatherDescriptionDay *weatherDescriptionDay in mNextDaysWeather){
        viewModel = [WDescriptionCityViewModel new];
        viewModel.titleString = [df stringFromDate:weatherDescriptionDay.date];
        viewModel.descriptionString = [NSString stringWithFormat:@"%i °C", (int)weatherDescriptionDay.main.temp];
        [mArraySecondSection addObject:viewModel];
    }
    
    [mViewModels addObject:[NSArray arrayWithArray:mArraySecondSection]];
    
    self.viewModels = [NSArray arrayWithArray:mViewModels];
}

- (void)setTableView:(UITableView *)tableView{
    _tableView = tableView;
    tableView.dataSource = self;
    [tableView registerClass:[WDescriptionCityTableViewCell class] forCellReuseIdentifier:kWDescriptionCityDataCollectorCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModels[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WDescriptionCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWDescriptionCityDataCollectorCellIdentifier];
    cell.viewModel = self.viewModels[indexPath.section][indexPath.row];
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return NSLocalizedString(@"Details",nil);
        }
        case 1:{
            return NSLocalizedString(@"Other Days",nil);
        }
        default:{
            return nil;
        }
    }
}

@end
