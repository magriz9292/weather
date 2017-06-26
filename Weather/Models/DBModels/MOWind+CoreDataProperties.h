//
//  MOWind+CoreDataProperties.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWind+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MOWind (CoreDataProperties)

+ (NSFetchRequest<MOWind *> *)fetchRequest;

@property (nonatomic) int16_t deg;
@property (nonatomic) int16_t speed;
@property (nullable, nonatomic, retain) MOWeatherDescriptionDay *weatherDescriptionDay;

@end

NS_ASSUME_NONNULL_END
