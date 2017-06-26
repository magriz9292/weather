//
//  WDataCollector.h
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWeatherCity.h"

@interface WDescriptionCityDataCollector : NSObject

@property (nonatomic, strong) WWeatherCity *weatherCity;

@property (nonatomic, strong) UITableView *tableView;

@end
