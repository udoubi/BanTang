//
//  HomeScrollView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/31.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeScrollView.h"

@implementation HomeScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
