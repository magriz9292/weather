//
//  MOWind+CoreDataProperties.m
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWind+CoreDataProperties.h"

@implementation MOWind (CoreDataProperties)

+ (NSFetchRequest<MOWind *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MOWind"];
}

@dynamic deg;
@dynamic speed;
@dynamic weatherDescriptionDay;

@end
