//
//  WWind.h
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface WWind : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic) NSInteger deg;
@property (nonatomic) NSInteger speed;

@end
