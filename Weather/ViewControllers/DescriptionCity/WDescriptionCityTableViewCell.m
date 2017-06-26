//
//  WDescriptionCityTableViewCell.m
//  Weather
//
//  Created by Михаил Гарбуз on 25.06.17.
//  Copyright © 2017 Михаил Гарбуз. All rights reserved.
//

#import "WDescriptionCityTableViewCell.h"

@interface WDescriptionCityTableViewCell()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation WDescriptionCityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *contentView = self.contentView;
        
        UILabel *titleLabel = [UILabel new];
        self.titleLabel = titleLabel;
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [contentView addSubview:titleLabel];
        
        UILabel *descriptionLabel = [UILabel new];
        self.descriptionLabel = descriptionLabel;
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [contentView addSubview:descriptionLabel];
        
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
        [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-indent-[titleLabel]-(>=indent)-[descriptionLabel]-indent-|"
                                                                            options:0
                                                                            metrics:@{@"indent" : @15}
                                                                              views:NSDictionaryOfVariableBindings(titleLabel,descriptionLabel)]];
    }
    return self;
}

- (void)setViewModel:(WDescriptionCityViewModel *)viewModel{
    _viewModel = viewModel;
    self.titleLabel.text = viewModel.titleString;
    self.descriptionLabel.text = viewModel.descriptionString;
}

@end
