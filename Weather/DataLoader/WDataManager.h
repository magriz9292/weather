//
//  WDataManager.h
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWeatherCity.h"

@class WDataManager;

@protocol WDataManagerDelegate <NSObject>

- (void)dataManager:(WDataManager*)sender reloadArrayModels:(NSArray <WWeatherCity*> *)arrayModels;
- (void)dataManager:(WDataManager*)sender errorWithDescription:(NSString*)string;

@end

@interface WDataManager : NSObject

@property (nonatomic, weak) id<WDataManagerDelegate> delegate;

- (void)reloadData;

- (void)loadCityWeather:(NSString *)cityName;

- (NSArray<WWeatherCity*> *)getCitiesWeather;

- (void)removeModel:(WWeatherCity*)model;

@end
