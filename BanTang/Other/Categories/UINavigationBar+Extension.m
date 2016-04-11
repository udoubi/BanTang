//
//  UINavigationBar+Extension.m
//  BanTang
//
//  Created by 江科 on 16/4/5.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UINavigationBar+Extension.h"
#import <objc/runtime.h>

static char overlayKey;

@implementation UINavigationBar (Extension)

- (void)setOverlayer:(UIView *)overlayer {
    
    objc_setAssociatedObject(self, &overlayKey, overlayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)overlayer {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)zz_setBackgroundColor:(UIColor *)color {
    if (!self.overlayer) {
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlayer = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlayer.userInteractionEnabled = NO;
        self.overlayer.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlayer atIndex:0];
    }
    self.overlayer.backgroundColor = color;
}

- (void)zz_setElementAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (alpha == 0.0) {
            view.hidden = YES;
        }else{
            view.hidden = NO;
            view.alpha = alpha;
        }
        
    }];
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        if (alpha == 0.0) {
            view.hidden = YES;
        }else{
            view.hidden = NO;
            view.alpha = alpha;
        }
    }];
    [self zz_setTitleViewAlpha:alpha];
}

- (void)zz_setTitleViewAlpha:(CGFloat)alpha {
    UIView *titleView = [self valueForKey:@"_titleView"];
    if (alpha == 0.0) {
        titleView.hidden = YES;
    }else{
        titleView.hidden = NO;
        titleView.alpha = alpha;
    }
}

- (void)zz_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    [self.overlayer removeFromSuperview];
    self.overlayer = nil;
}

@end
