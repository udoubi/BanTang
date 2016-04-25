//
//  SquareTableHeaderView.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareTableHeaderView.h"

@implementation SquareTableHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [UIView new];
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        
        UIView *leftLine = [UIView new];
        leftLine.backgroundColor = [UIColor colorWithWhite:0.920 alpha:1.000];
        [bgView addSubview:leftLine];
        
        UIView *rightLine = [UIView new];
        rightLine.backgroundColor = [UIColor colorWithWhite:0.920 alpha:1.000];
        [bgView addSubview:rightLine];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = @"种草小分队";
        titleLabel.font = [UIFont fontWithName:ThinFont size:13];
        [titleLabel sizeToFit];
        [bgView addSubview:titleLabel];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.height.mas_equalTo(35);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(bgView);
        }];
        [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.leading.equalTo(bgView).offset(10);
            make.trailing.equalTo(titleLabel.mas_leading).offset(-10);
            make.centerY.equalTo(bgView);
        }];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.leading.equalTo(titleLabel.mas_trailing).offset(10);
            make.trailing.equalTo(bgView).offset(-10);
            make.centerY.equalTo(bgView);
        }];
        
    }
    return self;
}

@end


@implementation SquareTableFooterView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [UIView new];
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        
        UIView *leftLine = [UIView new];
        leftLine.backgroundColor = [UIColor colorWithWhite:0.920 alpha:1.000];
        [bgView addSubview:leftLine];
        
        UIView *rightLine = [UIView new];
        rightLine.backgroundColor = [UIColor colorWithWhite:0.920 alpha:1.000];
        [bgView addSubview:rightLine];
        
        UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"commu_home_recom_change_icon"]];
        [titleImageView sizeToFit];
        [bgView addSubview:titleImageView];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.equalTo(self);
            make.height.mas_equalTo(25);
        }];
        [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(bgView);
        }];
        [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.leading.equalTo(bgView).offset(10);
            make.trailing.equalTo(titleImageView.mas_leading).offset(-10);
            make.centerY.equalTo(bgView);
        }];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.leading.equalTo(titleImageView.mas_trailing).offset(10);
            make.trailing.equalTo(bgView).offset(-10);
            make.centerY.equalTo(bgView);
        }];
        
    }
    return self;
}


@end