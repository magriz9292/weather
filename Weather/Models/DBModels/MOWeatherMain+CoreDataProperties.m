//
//  MOWeatherMain+CoreDataProperties.m
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherMain+CoreDataProperties.h"

@implementation MOWeatherMain (CoreDataProperties)

+ (NSFetchRequest<MOWeatherMain *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MOWeatherMain"];
}

@dynamic humidity;
@dynamic pressure;
@dynamic temp;
@dynamic weatherDescriptionDay;

@end
