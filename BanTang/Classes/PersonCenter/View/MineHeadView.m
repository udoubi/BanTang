//
//  MineHeadView.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MineHeadView.h"
#import "MineHeadTopView.h"
#import "HomeHotView.h"
#import "TitleScrollView.h"

@implementation MineHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        MineHeadTopView *topView = [[MineHeadTopView alloc]initWithFrame:CGRectMake(0, 0, Width, 260)];
        
        NSArray *titles = @[@"订单",@"好友",@"积分",@"小分队"];
        NSArray *images = @[@"center_menu_order_icon",@"center_menu_fans_icon",@"center_menu_jifen_icon",@"center_menu_xiaofendui_icon"];
        
        HomeHotView *hotView = [[HomeHotView alloc]initWithTitles:titles images:images];
        hotView.frame = CGRectMake(0, CGRectGetMaxY(topView.frame), Width, hotView.height);
        NSArray *subTitles = @[@"单品",@"清单",@"互动",@"发布"]
        
        TitleScrollView *titleView = [[TitleScrollView alloc]initWithTitleArray:subTitles itemWidth:Width / 4];
        titleView.frame = CGRectMake(0, CGRectGetMaxY(hotView.frame), Width, 30);
        [self addSubview:topView];
        [self addSubview:hotView];
        [self addSubview:titleView];
    }
    return self;
}

@end
