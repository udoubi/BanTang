//
//  TableHeaderView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/26.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeHeadView.h"

#import "PageScrollView.h"
#import "HomeHotView.h"

@interface HomeHeadView()

@property (nonatomic,strong) HomeHotView *hotView;

@end

@implementation HomeHeadView

- (instancetype)initWithHomeData:(HomeData *)homeData {
    if (self = [super init]) {
        NSMutableArray *bannerImages = [NSMutableArray array];
        [homeData.banners enumerateObjectsUsingBlock:^(HomeDataElemen *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [bannerImages addObject:obj.photo];
        }];
        PageScrollView *pageView = [PageScrollView pageScollView:bannerImages placeHolder:nil];
        [self addSubview:pageView];
        
        HomeHotView *hotView = [[HomeHotView alloc]initWithHotItems:homeData.hotItems];
        [self addSubview:hotView];
        self.hotView = hotView;
        [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(Width * 0.5);
            make.leading.top.trailing.equalTo(self);
        }];
        
        [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(pageView.mas_bottom);
            make.leading.trailing.equalTo(self);
            make.height.mas_equalTo(hotView.height);
        }];
    }
    return self;
}


- (CGFloat)height {
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.hotView.frame);
}
@end
