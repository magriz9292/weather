//
//  MOWeatherCity+CoreDataProperties.m
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherCity+CoreDataProperties.h"

@implementation MOWeatherCity (CoreDataProperties)

+ (NSFetchRequest<MOWeatherCity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MOWeatherCity"];
}

@dynamic cityName;
@dynamic weatherID;
@dynamic list;

@end
