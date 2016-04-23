//
//  squareGroupView.m
//  BanTang
//
//  Created by 江科 on 16/4/22.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareHeadView.h"
#import "TitleScrollView.h"
#import "SquareChannelView.h"


@interface SquareHeadView()<TitleScrollViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *channelScrollView;

@property (nonatomic,strong) TitleScrollView *titleView;
@end

@implementation SquareHeadView
- (instancetype)initWithSquareData:(SquareData *)squareData {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        NSMutableArray *titleArray = [NSMutableArray array];
        [squareData.module_elements enumerateObjectsUsingBlock:^(SquareChannel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [titleArray addObject:obj.title];
        }];
        TitleScrollView *titleView = [[TitleScrollView alloc]initWithTitleArray:titleArray itemWidth:Width / 4];
        titleView.delegate = self;
        self.titleView = titleView;
        [self addSubview:titleView];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.trailing.equalTo(self);
            make.height.mas_equalTo(40);
        }];
        
        
        UIScrollView *channelScrollView = [[UIScrollView alloc]init];
        channelScrollView.pagingEnabled = YES;
        channelScrollView.delegate = self;
        channelScrollView.showsHorizontalScrollIndicator = NO;
        UIView *contentView = [[UIView alloc]init];
        [self addSubview:channelScrollView];
        self.channelScrollView = channelScrollView;
        [channelScrollView addSubview:contentView];
        [channelScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(titleView.mas_bottom);
            make.bottom.equalTo(self);
        }];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(channelScrollView);
            make.height.equalTo(channelScrollView);
        }];
        
        SquareChannelView *lastView;
        for (NSInteger i = 0; i < squareData.module_elements.count; i ++) {
            SquareChannelView *channelView = [[SquareChannelView alloc]initWithChannel:squareData.module_elements[i]];
            [contentView addSubview:channelView];
            [channelView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(lastView?lastView.mas_trailing:@0);
                make.width.mas_equalTo(Width);
                make.top.bottom.equalTo(contentView);
            }];
            lastView = channelView;
        }
        [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(contentView.mas_trailing);
        }];
    }
    return self;
}
- (void)didTitleScrollViewCliked:(TitleScrollView *)titleScrollView atIndex:(NSInteger)index {
    [self.channelScrollView setContentOffset:CGPointMake(Width * index, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / Width;
    [self.titleView titleScrollViewScrollTo:index];
}
@end
