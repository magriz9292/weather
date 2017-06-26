//
//  WDataManager.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WDataManager.h"
#import "WNetworkLoader.h"
#import "WDataBaseManager.h"

@interface WDataManager()

@property(nonatomic, strong) WNetworkLoader *networkLoader;
@property(nonatomic, strong) WDataBaseManager *dataBaseManager;

@end

@implementation WDataManager

- (instancetype)init{
    self = [super init];
    if (self){
        self.networkLoader = [WNetworkLoader new];
        self.dataBaseManager = [WDataBaseManager new];
    }
    return self;
}

#pragma mark - Public

- (void)reloadData{
    NSArray<WWeatherCity*> *arrayModels = [self.dataBaseManager getCitiesWeather];
    
    if (!arrayModels.count && ![[NSUserDefaults standardUserDefaults] boolForKey:@"notFirstStart"]){
        NSMutableArray<WWeatherCity*> *mArray = [NSMutableArray new];
        WWeatherCity *model = [WWeatherCity new];
        model.cityName = @"Moskow";
        [mArray addObject:model];
        
        model = [WWeatherCity new];
        model.cityName = @"Saransk";
        [mArray addObject:model];
        
        arrayModels = [NSArray arrayWithArray:mArray];
    }
    
    [self _loadDataForArray:[NSMutableArray arrayWithArray:arrayModels]];
}

- (NSArray<WWeatherCity*> *)getCitiesWeather{
    return [self.dataBaseManager getCitiesWeather];
}

- (void)loadCityWeather:(NSString*)cityName{
    [self.networkLoader loadCityWeatherWithName:cityName withSuccessBlock:^(WWeatherCity *weatherCity) {
        [self.dataBaseManager saveObject:weatherCity completion:^() {
            [self.delegate dataManager:self reloadArrayModels:[self.dataBaseManager getCitiesWeather]];
        }];
    } withFailureBlock:^(NSError *error) {
        [self.delegate dataManager:self errorWithDescription:error.localizedDescription];
    }];
}

- (void)removeModel:(WWeatherCity*)model{
    [self.dataBaseManager removeObject:model completion:^(){
        [self.delegate dataManager:self reloadArrayModels:[self.dataBaseManager getCitiesWeather]];
    }];
}

#pragma mark - Private

- (void)_loadDataForArray:(NSMutableArray<WWeatherCity*>*)arrayModels{
    if (!arrayModels.count){
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"notFirstStart"];
        [self.delegate dataManager:self reloadArrayModels:[self.dataBaseManager getCitiesWeather]];
        return;
    }
    WWeatherCity *model = arrayModels.firstObject;
    [arrayModels removeObject:model];
    [self.networkLoader loadCityWeatherWithName:model.cityName withSuccessBlock:^(WWeatherCity *weatherCity) {
        [self.dataBaseManager saveObject:weatherCity completion:^() {
            [self _loadDataForArray:arrayModels];
        }];
    } withFailureBlock:^(NSError *error) {
        [self _loadDataForArray:arrayModels];
    }];
}

@end
