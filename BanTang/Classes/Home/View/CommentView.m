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
        UITextField *textField = [[UITextField alloc]init];
        textField.borderStyle= UITextBorderStyleRoundedRect;
//        textField.background = [UIImage imageNamed:@"bg_comment_text_field"];
        textField.placeholder = @"说点什么";
        textField.font = [UIFont fontWithName:ThinFont size:13];
        [self addSubview:iconImageView];
        [self addSubview:textField];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.equalTo(self);
        }];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(iconImageView.mas_trailing).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
@end
