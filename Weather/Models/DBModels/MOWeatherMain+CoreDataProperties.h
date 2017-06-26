//
//  MOWeatherMain+CoreDataProperties.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherMain+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MOWeatherMain (CoreDataProperties)

+ (NSFetchRequest<MOWeatherMain *> *)fetchRequest;

@property (nonatomic) int16_t humidity;
@property (nonatomic) int16_t pressure;
@property (nonatomic) int16_t temp;
@property (nullable, nonatomic, retain) MOWeatherDescriptionDay *weatherDescriptionDay;

@end

NS_ASSUME_NONNULL_END
