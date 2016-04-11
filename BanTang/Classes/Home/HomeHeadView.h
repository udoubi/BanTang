//
//  TableHeaderView.h
//  BanTang
//
//  Created by 天空之城 on 16/3/26.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeData.h"

@interface HomeHeadView : UIView
- (instancetype)initWithHomeData:(HomeData *)homeData;

@property (nonatomic,assign) CGFloat height;
@end
