//
//  MineTitleButton.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MineTitleButton.h"

@interface MineTitleButton()

@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UILabel *titleLabel;

@end
@implementation MineTitleButton

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        UILabel *countLabel = [UILabel new];
        countLabel.textColor = [UIColor whiteColor];
        countLabel.textAlignment = NSTextAlignmentCenter;
        countLabel.font = [UIFont fontWithName:RegularFont size:13];
        countLabel.text = @"0";
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        titleLabel.font = [UIFont fontWithName:RegularFont size:13];
        
        [self addSubview:countLabel];
        [self addSubview:titleLabel];
        
        [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.centerY.equalTo(self).offset(-10);
            make.height.mas_equalTo(20);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.centerY.equalTo(self).offset(10);
            make.height.mas_equalTo(20);
        }];
        
        self.countLabel = countLabel;
        self.titleLabel = titleLabel;
    }
    return self;
}
- (void)setCount:(NSString *)count {
    self.countLabel.text = count;
}
@end
