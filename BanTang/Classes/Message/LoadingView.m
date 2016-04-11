//
//  LoadingView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()

@property (nonatomic,strong) UIView *redBall;
@property (nonatomic,strong) UIView *yellowBall;
@property (nonatomic,strong) UIView *blueBall;


@end

@implementation LoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *redBall = [[UIView alloc]init];
        redBall.backgroundColor = [UIColor redColor];
        UIView *yellowBall = [[UIView alloc]init];
        yellowBall.backgroundColor = [UIColor yellowColor];
        UIView *blueBall = [[UIView alloc]init];
        blueBall.backgroundColor = [UIColor blueColor];
        [self addSubview:redBall];
        [self addSubview:yellowBall];
        [self addSubview:blueBall];
    }
    return self;
}

@end
