//
//  WListCitiesTableViewCell.h
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WListCitiesTableViewCellDelegate <NSObject>

- (void)pressDeleteButtonWithIndex:(NSUInteger)index;

@end

@interface WListCitiesTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *descriptionString;
@property (nonatomic) NSUInteger index;

@property(nonatomic, weak) id<WListCitiesTableViewCellDelegate> delegate;

@end
