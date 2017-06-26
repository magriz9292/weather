//
//  MOWeatherDescriptionDay+CoreDataClass.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MOWeatherCity, MOWeatherMain, MOWind;

NS_ASSUME_NONNULL_BEGIN

@interface MOWeatherDescriptionDay : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "MOWeatherDescriptionDay+CoreDataProperties.h"
