//
//  HomeHotView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeHotView.h"
#import "HomeHotItemView.h"

@interface HomeHotView()

@property (nonatomic,assign) CGFloat itemViewH;

@property (nonatomic,strong) NSArray *hotItems;
@end

@implementation HomeHotView

-(instancetype)initWithHotItems:(NSArray<HomeDataElemen *> *)hotItems{
    if (self = [super init]) {
        _hotItems = hotItems;
        for (NSInteger i = 0; i < hotItems.count; i++) {
            HomeHotItemView *itemView = [HomeHotItemView IconImageTextView:hotItems[i].photo title:hotItems[i].title placeHolder:nil];
            [self addSubview:itemView];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat itemViewW = Width / 4;
    self.itemViewH = itemViewW + 15;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        HomeHotItemView *itemView = self.subviews[i];
        CGFloat itemViewX = (i % 4 ) * itemViewW ;
        CGFloat itemViewY = (i / 4) * self.itemViewH;
        itemView.frame = CGRectMake(itemViewX, itemViewY, itemViewW, self.itemViewH);
    }
}

- (CGFloat)height {
    [self layoutIfNeeded];
    return self.itemViewH * (self.hotItems.count / 4);
}

@end
