//
//  WDataBaseManager.h
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWeatherCity.h"

@interface WDataBaseManager : NSObject

- (NSArray<WWeatherCity*> *)getCitiesWeather;
- (void)saveObject:(WWeatherCity*)weatherCity completion:(void (^)())completion;
- (void)removeObject:(WWeatherCity*)weatherCity completion:(void (^)())completion;

@end
