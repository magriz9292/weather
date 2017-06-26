//
//  WWeatherDescription.h
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "WWeatherDescriptionDay.h"

@interface WWeatherCity : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property(nonatomic, strong) NSArray<WWeatherDescriptionDay*> *list;
@property(nonatomic, strong) NSString *cityName;
@property(nonatomic) NSInteger weatherID;

@end
