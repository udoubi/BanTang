//
//  HomeHotView.h
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeData.h"

@interface HomeHotView : UIView
@property (nonatomic,assign) CGFloat height;

-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images;
@end
