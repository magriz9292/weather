//
//  WNetworkLoader.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WNetworkLoader.h"
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>

static NSString *BASE_URL = @"http://api.openweathermap.org/data/2.5/";
static NSString *APP_ID = @"ccdb3f68256490fb5e545528262f1831";

@interface WNetworkLoader()

@property(nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation WNetworkLoader

- (instancetype)init{
    self = [super init];
    if (self){
        self.manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    }
    return self;
}

- (void)loadCityWeatherWithName:(NSString*)cityName
               withSuccessBlock:(void (^)(WWeatherCity *weatherCity))success
               withFailureBlock:(void (^)(NSError *error))failure{
    [self _GET:@"forecast"
    parameters:@{@"q" : cityName}
      progress:nil
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           NSError *error;
           WWeatherCity *weather = [MTLJSONAdapter modelOfClass:[WWeatherCity class] fromJSONDictionary:responseObject error:&error];
           success(weather);
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           failure(error);
       }];
}

-(void) _GET:(NSString *)URLString
  parameters:(id)parameters
    progress:(void (^)(NSProgress * _Nonnull))downloadProgress
     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    if (!parameters){
        parameters = @{};
    }
    
    NSMutableDictionary *mParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [mParams setObject:APP_ID forKey:@"APPID"];
    [mParams setObject:@"metric" forKey:@"units"];
    [mParams setObject:@"ru" forKey:@"lang"];
    parameters = [NSDictionary dictionaryWithDictionary:mParams];
    
    [self.manager GET:URLString
           parameters:parameters
             progress:downloadProgress success:success
              failure:failure];
}

@end
