//
//  WWeatherMain.h
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface WWeatherMain : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property(nonatomic) NSInteger humidity;
@property(nonatomic) NSInteger pressure;
@property(nonatomic) NSInteger temp;

@end
