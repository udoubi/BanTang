//
//  SquareGroupItemView.m
//  BanTang
//
//  Created by 江科 on 16/4/22.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareGroupItemView.h"

@interface SquareGroupItemView()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@end

@implementation SquareGroupItemView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgImageView = [UIImageView new];
        bgImageView.layer.cornerRadius = 25;
        UILabel *titleLabel =[UILabel new];
        UILabel *subTitleLabel =[UILabel new];
        titleLabel.font = [UIFont fontWithName:ThinFont size:14];
        titleLabel.textColor = [UIColor whiteColor];
        subTitleLabel.font = [UIFont fontWithName:ThinFont size:12];
        subTitleLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:bgImageView];
        [self addSubview:titleLabel];
        [self addSubview:subTitleLabel];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(10);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(bgImageView.mas_bottom);
            make.height.mas_equalTo(20);
        }];
        
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.top.equalTo(titleLabel.mas_bottom);
            make.height.mas_equalTo(20);
        }];
        
        self.bgImageView = bgImageView;
        self.titleLabel = titleLabel;
        self.subTitleLabel = subTitleLabel;
    }
    return self;
}

@end
