//
//  CommentView.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "CommentListView.h"
#import "CommentItemView.h"

@implementation CommentListView

- (void)setComments:(NSArray<CommentModel *> *)comments {
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    // 最多展示3条评论
    NSInteger count = MIN(3, comments.count);
    CommentItemView *lastView;
    for ( NSInteger i = 0; i < count; i ++) {
        CommentItemView *commentView = [[CommentItemView alloc]initWithComment:comments[i]];
        [self addSubview:commentView];
        
        [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.mas_bottom : @0);
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
        }];
        lastView = commentView;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
    }];
}
@end
