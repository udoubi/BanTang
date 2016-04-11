//
//  UIBarButtonItem+Extension.h
//  BanTang
//
//  Created by 江科 on 16/4/5.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg
                              hltImg:(NSString *)hltImg
                              target:(id)target
                              action:(SEL)action;
@end
