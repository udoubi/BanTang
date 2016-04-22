//
//  LoadingView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()

@property (nonatomic,strong) NSMutableArray<UIImage *> *imageArray;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation LoadingView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:imageView];
        self.imageView = imageView;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 9));
            make.center.equalTo(self);
        }];
    }
    return self;
}



- (void)startAnimating {
    if ([self.imageView isAnimating]) return;
    [self.imageView setAnimationImages:self.imageArray];
    [self.imageView setAnimationDuration:self.imageArray.count * 0.075];
    [self.imageView setAnimationRepeatCount:0];
    [self.imageView startAnimating];
}
- (void) stopAnimating {
    if ([self.imageView isAnimating]) {
        [self.imageView stopAnimating];
    }
    [self removeFromSuperview];
}

- (NSMutableArray<UIImage *> *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 21; i ++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading%ld",i + 1]];
            [_imageArray addObject:image];
        }
    }
    return _imageArray;
}

@end
