//
//  CommentView.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "CommentView.h"

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HeaderPlaceHolder"]];
        UIButton *commnetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commnetBtn setBackgroundImage:[UIImage imageNamed:@"bg_comment_text_field"] forState:UIControlStateNormal];
        commnetBtn.titleLabel.font = [UIFont fontWithName:ThinFont size:13];
        commnetBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -150, 0, 0);
        [commnetBtn setTitleColor:[UIColor colorWithWhite:0.522 alpha:1.000] forState:UIControlStateNormal];
        [commnetBtn setTitle:@"说点什么" forState:UIControlStateNormal];
        [self addSubview:iconImageView];
        [self addSubview:commnetBtn];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.equalTo(self);
        }];
        [commnetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(iconImageView.mas_trailing).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
@end
