//
//  WDataBaseManager.m
//  Weather
//
//  Created by Михаил Гарбуз on 24.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WDataBaseManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "WWeatherCity.h"
#import "MOWeatherCity+CoreDataClass.h"

@implementation WDataBaseManager

- (NSManagedObjectContext *)moc {
    return [NSManagedObjectContext MR_defaultContext];
}

- (NSArray<WWeatherCity*> *)getCitiesWeather{
    NSArray *array = [MOWeatherCity MR_findAll];
    NSMutableArray<WWeatherCity*> *mArray = [NSMutableArray new];
    for (MOWeatherCity *managedObject in array){
        WWeatherCity *weatherCity = [MTLManagedObjectAdapter modelOfClass:[WWeatherCity class] fromManagedObject:managedObject error:nil];
        [mArray addObject:weatherCity];
    }
    return [NSArray arrayWithArray:mArray];
}

- (void)saveObject:(WWeatherCity*)weatherCity completion:(void (^)())completion{
    [MTLManagedObjectAdapter managedObjectFromModel:weatherCity insertingIntoContext:[self moc] error:nil];
    [self saveContextComplete:completion];
}

- (void)removeObject:(WWeatherCity*)weatherCity completion:(void (^)())completion{
    MOWeatherCity *managedObject = [MOWeatherCity MR_findFirstByAttribute:@"weatherID" withValue:@(weatherCity.weatherID)];
    [managedObject MR_deleteEntity];
    [self saveContextComplete:completion];
}

- (void)saveContextComplete:(void (^)())completion{
    [[self moc] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"You successfully saved your context.");
            if (completion){
                completion();
            }
        } else if (error) {
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
}

@end
