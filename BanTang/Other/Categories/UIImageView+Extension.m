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

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage animate:(BOOL)animate{
    if (animate) {
        [self sd_setImageWithURL:url placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.alpha = 0.0;
            self.image = image;
            [UIView animateWithDuration:0.5 animations:^{
                self.alpha = 1.0;
            }];
        }];
    }else {
        [self sd_setImageWithURL:url placeholderImage:placeholderImage];
    }
}

@end
