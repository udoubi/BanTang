//
//  UIBarButtonItem+Extension.m
//  BanTang
//
//  Created by 江科 on 16/4/5.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg
                                 hltImg:(NSString *)hltImg
                                 target:(id)target
                                 action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *nmlImage = [UIImage imageNamed:nmlImg];
    
    [btn setImage:nmlImage forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hltImg] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.bounds = CGRectMake(0, 0, nmlImage.size.width, nmlImage.size.height);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
@end
