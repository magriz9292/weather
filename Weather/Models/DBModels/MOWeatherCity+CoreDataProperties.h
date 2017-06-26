//
//  MOWeatherCity+CoreDataProperties.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "MOWeatherCity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MOWeatherCity (CoreDataProperties)

+ (NSFetchRequest<MOWeatherCity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cityName;
@property (nonatomic) int64_t weatherID;
@property (nullable, nonatomic, retain) NSOrderedSet<MOWeatherDescriptionDay *> *list;

@end

@interface MOWeatherCity (CoreDataGeneratedAccessors)

- (void)insertObject:(MOWeatherDescriptionDay *)value inListAtIndex:(NSUInteger)idx;
- (void)removeObjectFromListAtIndex:(NSUInteger)idx;
- (void)insertList:(NSArray<MOWeatherDescriptionDay *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeListAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInListAtIndex:(NSUInteger)idx withObject:(MOWeatherDescriptionDay *)value;
- (void)replaceListAtIndexes:(NSIndexSet *)indexes withList:(NSArray<MOWeatherDescriptionDay *> *)values;
- (void)addListObject:(MOWeatherDescriptionDay *)value;
- (void)removeListObject:(MOWeatherDescriptionDay *)value;
- (void)addList:(NSOrderedSet<MOWeatherDescriptionDay *> *)values;
- (void)removeList:(NSOrderedSet<MOWeatherDescriptionDay *> *)values;

@end

NS_ASSUME_NONNULL_END
