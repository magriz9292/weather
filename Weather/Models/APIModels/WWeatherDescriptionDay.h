//
//  WWeatherDescriptionDay.h
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>
#import "WWind.h"
#import "WWeatherMain.h"

@interface WWeatherDescriptionDay :  MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) WWind *wind;
@property (nonatomic, strong) WWeatherMain *main;

@end
