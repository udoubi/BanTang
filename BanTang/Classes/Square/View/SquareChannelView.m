//
//  SquareChannelView.m
//  BanTang
//
//  Created by 江科 on 16/4/23.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareChannelView.h"
#import "SquareChannelItemView.h"

@implementation SquareChannelView

- (instancetype)initWithChannel:(SquareChannel *)channel {
    if (self = [super init]) {
        
        SquareChannelItemView *lastView;
        for (NSInteger i = 0; i < 8; i ++) {
            SquareChannelItemView *itemView = [[SquareChannelItemView alloc]init];
            itemView.channelItem = channel.elements[i];
            [self addSubview:itemView];
            if (i == 4) {
                [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(self);
                    make.top.equalTo(lastView.mas_bottom);
                    make.width.mas_equalTo(Width / 4);
                }];
            }else {
                [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(lastView?lastView.mas_trailing:@0);
                    make.width.mas_equalTo(Width / 4);
                    make.top.equalTo(lastView?lastView.mas_top:@0);
                }];
            }
            lastView = itemView;
        }
//        [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self);
//        }];
    }
    return self;
}



@end
