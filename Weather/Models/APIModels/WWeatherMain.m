//
//  WWeatherMain.m
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WWeatherMain.h"
#import "MOWeatherMain+CoreDataClass.h"

@implementation WWeatherMain
#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return NSStringFromClass([MOWeatherMain class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

@end
