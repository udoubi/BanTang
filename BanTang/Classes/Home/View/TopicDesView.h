//
//  TopicDesView.h
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicDetailData.h"
@interface TopicDesView : UIView

@property (nonatomic,strong) HomeTopicModel *topic;


- (CGFloat)viewHeight:(HomeTopicModel *)topic;
@end
