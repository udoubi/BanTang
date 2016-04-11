//
//  RecomendToolBar.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductToolBar.h"
#import "HomeCell.h"

@implementation ProductToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
        UIImageView *commentImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_group_comment"]];
        UIImageView *likeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_group_like"]];
        UIImageView *shareImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_group_share"]];
        UIImageView *moreImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_group_more"]];
        moreImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:commentImageView];
        [self addSubview:likeImageView];
        [self addSubview:shareImageView];
        [self addSubview:moreImageView];
        
        [commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(21, 21));
            make.centerY.equalTo(self);
        }];
        [likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(commentImageView.mas_trailing).offset(20);
            make.size.mas_equalTo(CGSizeMake(21, 21));
            make.centerY.equalTo(self);
        }];
        [shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(likeImageView.mas_trailing).offset(20);
            make.size.mas_equalTo(CGSizeMake(21, 21));
            make.centerY.equalTo(self);
        }];
        [moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(21, 21));
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
@end
