//
//  HomeHotView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeHotView.h"
#import "HomeHotItemView.h"


// 一排显示几个item
static NSInteger const kCountInRow = 4;

@interface HomeHotView()

@property (nonatomic,assign) CGFloat itemViewH;

@property (nonatomic,strong) NSArray *titles;
@end

@implementation HomeHotView

-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images{
    if (self = [super init]) {
        _titles = titles;
        HomeHotItemView *lastView;
        for (NSInteger i = 0; i < titles.count; i++) {
            HomeHotItemView *itemView = [HomeHotItemView IconImageTextView:images[i] title:titles[i] placeHolder:nil];
            [self addSubview:itemView];
            
            if (lastView != nil && i % kCountInRow == 0 ) {
                [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(self);
                    make.top.equalTo(lastView.mas_bottom);
                    make.width.mas_equalTo(Width / kCountInRow);
                }];
            }else {
                [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(lastView?lastView.mas_trailing:@0);
                    make.top.equalTo(lastView?lastView.mas_top:@0);
                    make.width.mas_equalTo(Width / kCountInRow);
                }];
            }
            lastView = itemView;
        }
        [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
        }];
    }
    return self;
}
@end
