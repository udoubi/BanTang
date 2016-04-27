//
//  SignView.m
//  BanTang
//
//  Created by 江科 on 16/4/26.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "AppSignView.h"

@interface AppSignView()

@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation AppSignView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.500];
        UIImageView *imageView = [[UIImageView alloc]init];
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"sign_alert_close_btn"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeSignView) forControlEvents:UIControlEventTouchUpInside];
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setImage:[UIImage imageNamed:@"sign_share_btn"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(shareSign) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgView];
        [self addSubview:closeBtn];
        [bgView addSubview:imageView];
        [bgView addSubview:shareBtn];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.center.equalTo(self);
        }];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(bgView).offset(10);
            make.trailing.equalTo(bgView).offset(-10);
            make.top.equalTo(bgView).offset(10);
            make.height.mas_equalTo(Width - 40);
        }];
        
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgView);
            make.top.equalTo(imageView.mas_bottom).offset(15);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(120);
            make.bottom.equalTo(bgView).offset(-15);
        }];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.mas_top);
            make.trailing.equalTo(bgView);
            make.size.mas_equalTo(CGSizeMake(28, 40));
        }];
        
        self.imageView = imageView;
    }
    return self;
}
- (void)closeSignView {
    [self removeFromSuperview];
}
- (void)shareSign {}

- (void)setUrl:(NSString *)url {
    [self.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil animate:NO];
}
@end
