//
//  MOWeatherDescriptionDay+CoreDataProperties.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherDescriptionDay+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MOWeatherDescriptionDay (CoreDataProperties)

+ (NSFetchRequest<MOWeatherDescriptionDay *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *clouds;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *weatherDescription;
@property (nullable, nonatomic, retain) MOWeatherMain *main;
@property (nullable, nonatomic, retain) MOWind *wind;
@property (nullable, nonatomic, retain) MOWeatherCity *weatherCity;

@end

NS_ASSUME_NONNULL_END
