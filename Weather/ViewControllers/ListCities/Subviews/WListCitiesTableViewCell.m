//
//  WListCitiesTableViewCell.m
//  Weather
//
//  Created by Михаил Гарбуз on 26.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WListCitiesTableViewCell.h"

@interface WListCitiesTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation WListCitiesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        UIView *contentView = self.contentView;
        
        UILabel *titleLabel = [UILabel new];
        self.titleLabel = titleLabel;
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [contentView addSubview:titleLabel];
        
        UILabel *descriptionLabel = [UILabel new];
        self.descriptionLabel = descriptionLabel;
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [descriptionLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [contentView addSubview:descriptionLabel];
        
        UIButton *button = [UIButton new];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button setTitle:NSLocalizedString(@"Remove", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
        [button setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [contentView addSubview:button];
        
        [contentView addConstraint:[NSLayoutConstraint constraintWithItem:descriptionLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:contentView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1
                                                                 constant:0]];
        [contentView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:contentView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1
                                                                 constant:0]];
        [contentView addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:contentView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1
                                                                 constant:0]];
        [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-indent-[titleLabel]-indent-[descriptionLabel]-(>=indent)-[button]-indent-|"
                                                                            options:0
                                                                            metrics:@{@"indent" : @15}
                                                                              views:NSDictionaryOfVariableBindings(titleLabel,descriptionLabel,button)]];
    }
    return self;
}

#pragma mark - actions

- (void)pressDeleteButton{
    [self.delegate pressDeleteButtonWithIndex:self.index];
}

#pragma mark - setters

- (void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    self.titleLabel.text = titleString;
}

- (void)setDescriptionString:(NSString *)descriptionString{
    _descriptionString = descriptionString;
    self.descriptionLabel.text = descriptionString;
}

@end
