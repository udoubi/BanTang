//
//  PageScrollView.h
//  LoveFreshBeen_OC
//
//  Created by 天空之城 on 16/3/4.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PageScrollView;

@interface PageScrollView : UIView

+ (instancetype)pageScollView:(NSArray<NSString *> *)images placeHolder:(UIImage *)placeHolderImage;
@end
