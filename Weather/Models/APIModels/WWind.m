//
//  WWind.m
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WWind.h"
#import "MOWind+CoreDataClass.h"

@implementation WWind
#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return NSStringFromClass([MOWind class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

@end
