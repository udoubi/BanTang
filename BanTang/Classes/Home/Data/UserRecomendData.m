//
//  UserRecomendData.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UserRecomendData.h"

@implementation UserRecomendData
+ (void)loadUserRecomendData:(Completelock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"user_recomend" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    UserRecomendData *recomendData = [UserRecomendData mj_objectWithKeyValues:dic[@"data"]];
    complete(recomendData.list,nil);
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list":NSStringFromClass([UserRecomend class])};
}
@end

@implementation TagModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"tid":@"id"};
}
@end

@implementation UserRecomend

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"rid":@"id"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"comments":NSStringFromClass([CommentModel class]),
             @"pics":NSStringFromClass([RecomendPicModel class]),
             @"product":NSStringFromClass([RelateProduct class]),
             @"tags":NSStringFromClass([TagModel class])
             };
}


@end
@implementation RecomendPicModel


@end

@implementation RelateProduct


@end

@implementation DynamicModel



@end

@implementation AuthorModel


@end


@implementation CommentModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"cid":@"id"};
}
@end
