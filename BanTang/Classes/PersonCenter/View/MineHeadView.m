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

@interface MineHeadView()

@property (nonatomic,strong) MineHeadTopView *topView;

@end

@implementation MineHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        MineHeadTopView *topView = [[MineHeadTopView alloc]init];
        
        NSArray *titles = @[@"订单",@"好友",@"积分",@"小分队"];
        NSArray *images = @[@"center_menu_order_icon",@"center_menu_fans_icon",@"center_menu_jifen_icon",@"center_menu_xiaofendui_icon"];
        
        HomeHotView *hotView = [[HomeHotView alloc]initWithTitles:titles images:images];
        NSArray *subTitles = @[@"单品",@"清单",@"互动",@"发布"];
        
        TitleScrollView *titleView = [[TitleScrollView alloc]initWithTitleArray:subTitles itemWidth:Width / 4];
        titleView.layer.borderWidth = 0.5;
        titleView.layer.borderColor = [UIColor colorWithWhite:0.977 alpha:1.000].CGColor;
        [self addSubview:topView];
        [self addSubview:hotView];
        [self addSubview:titleView];
        
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.height.mas_equalTo(Width * 0.66);
        }];
        [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topView.mas_bottom);
            make.leading.trailing.equalTo(self);
        }];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(hotView.mas_bottom);
            make.height.mas_equalTo(40);
            make.leading.trailing.bottom.equalTo(self);
        }];
        
        self.topView = topView;
    }
    return self;
}
- (void)setUserInfo:(UserInfoData *)userInfo {
    self.topView.userInfo = userInfo;
}
@end
