//
//  IconImageTextView.m
//  LoveFreshBeen_OC
//
//  Created by 天空之城 on 16/3/7.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeHotItemView.h"

@interface HomeHotItemView()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImage *placeHolder;
@end
@implementation HomeHotItemView

- (instancetype)init {
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = NO;
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        self.label.userInteractionEnabled = NO;
        self.label.font = [UIFont fontWithName:ThinFont size:12];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.top.equalTo(self).offset(15);
        }];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(10);
            make.height.mas_equalTo(20);
            make.leading.trailing.bottom.equalTo(self);
        }];
    }
    return self;
}


+ (instancetype)IconImageTextView:(NSString *)image title:(NSString *)title placeHolder:(UIImage *)placeHolder {
    HomeHotItemView *view = [[self alloc]init];
    if ([UIImage imageNamed:image])  {
        view.imageView.image = [UIImage imageNamed:image];
    }else {
        [view.imageView setImageWithURL:[NSURL URLWithString:image] placeholderImage:placeHolder animate:YES];
    }
    
    view.label.text = title;
    return view;
}


@end
