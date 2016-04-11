//
//  UIImageView+Extention.m
//  LoveFreshBeen_OC
//
//  Created by 天空之城 on 16/3/10.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (Extension)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:url placeholderImage:placeholderImage];
}

@end
