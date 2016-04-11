//
//  HomeData.m
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeData.h"

@implementation HomeData
+ (void)loadHomeData:(Completelock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeData" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    HomeData *homeData = [HomeData mj_objectWithKeyValues:dic[@"data"]];
    complete(homeData,nil);
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"topics":@"HomeDataElemen",
             @"categories":@"HomeDataElemen",
             @"hotItems":@"HomeDataElemen",
             @"banners":@"HomeDataElemen"
             };
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"topics":@"topic",
             @"categories":@"category_element",
             @"hotItems":@"banner_bottom_element",
             @"banners":@"banner"
             };
}
@end

@implementation HomeDataElemen

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"hid":@"id"};
}

@end