//
//  SquareTitleView.m
//  BanTang
//
//  Created by 江科 on 16/4/22.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareTitleView.h"

@interface SquareTitleView()
@property (nonatomic,strong) UIButton *leftButon;
@property (nonatomic,strong) UIButton *rightButon;
@end

@implementation SquareTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        SquareTitleViewButton *leftButon = [SquareTitleViewButton buttonWithType:UIButtonTypeCustom];
        [leftButon setTitle:@"广场" forState:UIControlStateNormal];
        SquareTitleViewButton *rightButon = [SquareTitleViewButton buttonWithType:UIButtonTypeCustom];
        [rightButon setTitle:@"关注" forState:UIControlStateNormal];
        [leftButon addTarget:self action:@selector(buttonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [rightButon addTarget:self action:@selector(buttonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [leftButon sizeToFit];
        [rightButon sizeToFit];
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:leftButon];
        [self addSubview:rightButon];
        [self addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.mas_equalTo(0.5);
            make.top.equalTo(self).offset(8);
            make.bottom.equalTo(self).offset(-8);
        }];
        
        [leftButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(lineView.mas_leading).offset(-10);
            make.centerY.equalTo(self);
        }];
        [rightButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.leading.equalTo(lineView.mas_trailing).offset(10);
        }];
        leftButon.selected = YES;
        rightButon.selected = NO;
    
        self.leftButon = leftButon;
        self.rightButon = rightButon;
    }
    return self;
}

- (void)buttonCliked:(UIButton *)btn {
    self.rightButon.selected = NO;
    self.leftButon.selected = NO;
    btn.selected = !btn.selected;
}
@end
@implementation SquareTitleViewButton

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.titleLabel.font = [UIFont fontWithName:RegularFont size:14];
    }else {
        self.titleLabel.font = [UIFont fontWithName:ThinFont size:14];
    }
}

@end