//
//  TopicDesView.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "TopicDesView.h"

/** 边距  */
static const CGFloat kDefaultMargin = 10;

/** 顶部图片的高度  */
#define kTopImageViewHeight  0.55 * Width
@interface TopicDesView()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *desLabel;;


@end

@implementation TopicDesView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont fontWithName:LightFont size:18];
        UILabel *desLabel = [[UILabel alloc]init];
        desLabel.font = [UIFont fontWithName:ThinFont size:15];
        desLabel.preferredMaxLayoutWidth = Width - 2 * kDefaultMargin;
        desLabel.numberOfLines = 0;
        [self addSubview:titleLabel];
        [self addSubview:desLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.mas_equalTo(30);
        }];
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(10);
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
        }];
        
        self.titleLabel = titleLabel;
        self.desLabel = desLabel;
    }
    return self;
}
- (void)setTopic:(HomeTopicModel *)topic {
    
}
- (CGFloat)viewHeight:(HomeTopicModel *)topic {
    self.titleLabel.text = topic.title;
    self.desLabel.text = topic.desc;
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.desLabel.frame);
}
@end
