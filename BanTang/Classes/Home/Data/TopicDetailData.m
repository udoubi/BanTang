//
//  ProductDetailData.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "TopicDetailData.h"

@implementation TopicDetailData

+ (void)loadTopicData:(Completelock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_detail" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    TopicDetailData *topicData = [TopicDetailData mj_objectWithKeyValues:dic];
    complete(topicData.data,nil);
}

@end

@implementation HomeTopicModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"product":NSStringFromClass([ProductDetail class])};
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"tid":@"id"};
}

@end

@implementation ProductDetail

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"pic":NSStringFromClass([PicModel class]),
             @"likes_list":NSStringFromClass([LikeModel class])
             };
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"pid":@"id"};
}

@end

@implementation PicModel



@end

@implementation LikeModel


@end