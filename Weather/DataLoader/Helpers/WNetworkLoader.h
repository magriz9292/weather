//
//  WNetworkLoader.h
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWeatherCity.h"

@interface WNetworkLoader : NSObject

- (void)loadCityWeatherWithName:(NSString*)cityName
               withSuccessBlock:(void (^)(WWeatherCity *weatherDescription))success
               withFailureBlock:(void (^)(NSError *error))failure;
@end
