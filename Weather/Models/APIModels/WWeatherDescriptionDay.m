//
//  WWeatherDescriptionDay.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WWeatherDescriptionDay.h"
#import "MOWeatherDescriptionDay+CoreDataClass.h"

@implementation WWeatherDescriptionDay

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return NSStringFromClass([MOWeatherDescriptionDay class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{@"wind" : [WWind class],
             @"main" : [WWeatherMain class]};
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"date" : @"dt",
             @"weatherDescription" : @"weather"};
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *interval) {
        return [NSDate dateWithTimeIntervalSince1970:[interval integerValue]];
    } reverseBlock:^id(NSDate *date) {
        return @([date timeIntervalSince1970]);
    }];
}

+ (NSValueTransformer *)weatherDescriptionJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(NSArray<NSDictionary*> *dict) {
        return dict.firstObject[@"description"];
    }];
}

+ (NSValueTransformer *)windJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[WWind class]];
}

+ (NSValueTransformer *)mainJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[WWeatherMain class]];
}

@end
