//
//  ProductTagView.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductTagView.h"

@interface ProductTagView()
@end

@implementation ProductTagView

- (void)setTags:(NSArray<TagModel *> *)tags {
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    UIImageView *tagImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"community_tag"]];
    [self addSubview:tagImageView];
    [tagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    UILabel *lastLabel;
    CGFloat totalWidth = 30;
    for (NSInteger i = 0; i < tags.count; i ++) {
        UILabel *label = [[UILabel alloc]init];
        label.text = tags[i].name;
        [label sizeToFit];
        label.textColor = [UIColor redColor];
        label.font = [UIFont fontWithName:ThinFont size:12];
        [self addSubview:label];
        NSInteger rows = 0;
        if (totalWidth < Width) {
            if (!lastLabel) {
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(tagImageView.mas_trailing).offset(10);
                    make.centerY.equalTo(tagImageView);
                }];
            }else{
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(lastLabel.mas_trailing).offset(10);
                    make.centerY.equalTo(lastLabel);
                }];
            }
        }else{
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self).offset(10);
                make.top.mas_equalTo(30 * (rows + 1) );
            }];
            totalWidth = 30;
            rows ++;
        }
        totalWidth += CGRectGetWidth(label.frame) + 10;
        lastLabel = label;
    }
    [lastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
    }];
}
@end
