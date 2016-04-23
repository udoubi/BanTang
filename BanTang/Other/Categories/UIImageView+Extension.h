//
//  UIImageView+Extention.h
//  LoveFreshBeen_OC
//
//  Created by 天空之城 on 16/3/10.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage animate:(BOOL)animate;
@end
