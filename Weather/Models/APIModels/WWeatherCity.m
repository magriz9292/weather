//
//  WWeatherDescription.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WWeatherCity.h"
#import "MOWeatherCity+CoreDataClass.h"

@implementation WWeatherCity

#pragma mark - MTLManagedObjectSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"cityName" : @"city",
             @"weatherID" :@"city"};
}

+ (NSString *)managedObjectEntityName {
    return NSStringFromClass([MOWeatherCity class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{@"list" : [WWeatherDescriptionDay class]};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObjects:@"weatherID", nil];
}

#pragma mark - MTLJSONSerializing

+ (NSValueTransformer *)cityNameJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(NSDictionary *dict) {
        return dict[@"name"];
    }];
}

+ (NSValueTransformer *)weatherIDJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(NSDictionary *dict) {
        return dict[@"id"];
    }];
}

+ (NSValueTransformer *)listJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[WWeatherDescriptionDay class]];
}

@end
