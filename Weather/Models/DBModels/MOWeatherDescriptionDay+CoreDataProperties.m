//
//  MOWeatherDescriptionDay+CoreDataProperties.m
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherDescriptionDay+CoreDataProperties.h"

@implementation MOWeatherDescriptionDay (CoreDataProperties)

+ (NSFetchRequest<MOWeatherDescriptionDay *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MOWeatherDescriptionDay"];
}

@dynamic clouds;
@dynamic date;
@dynamic weatherDescription;
@dynamic main;
@dynamic wind;
@dynamic weatherCity;

@end
