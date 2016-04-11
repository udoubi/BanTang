//
//  TitleScrollView.h
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleScrollView;

@protocol TitleScrollViewDelegate <NSObject>

- (void)didTitleScrollViewCliked:(TitleScrollView *)titleScrollView atIndex:(NSInteger)index;

@end

@interface TitleScrollView : UIView

@property (nonatomic,weak) id<TitleScrollViewDelegate> delegate;

- (instancetype)initWithTitleArray:(NSArray *)titleArray itemWidth:(CGFloat)itemWidth;
- (void)titleScrollViewScrollTo:(NSInteger)index;
@end
