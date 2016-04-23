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
        self.imageView.userInteractionEnabled = NO;
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        self.label.userInteractionEnabled = NO;
        self.label.font = [UIFont fontWithName:ThinFont size:12];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.trailing.mas_equalTo(-15);
            make.bottom.equalTo(self.label.mas_top).offset(-10);
        }];
    }
    return self;
}


+ (instancetype)IconImageTextView:(NSString *)image title:(NSString *)title placeHolder:(UIImage *)placeHolder {
    HomeHotItemView *view = [[self alloc]init];
    [view.imageView setImageWithURL:[NSURL URLWithString:image] placeholderImage:placeHolder animate:YES];
    view.label.text = title;
    return view;
}


@end
