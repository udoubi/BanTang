//
//  TitleButton.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/20.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "TitleButton.h"
#import "Masonry.h"
@implementation TitleButton
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat centerX = self.frame.size.width / 2;
    CGFloat centerY = self.frame.size.height / 2;
    self.titleLabel.center = CGPointMake(centerX - 10, centerY);
    self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + 10,centerY, self.imageView.frame.size.width, self.imageView.frame.size.height);
    self.imageView.center = CGPointMake(self.imageView.frame.origin.x, centerY);
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.imageView.transform = CGAffineTransformMakeRotation(M_PI * 1 *selected);
}
@end
