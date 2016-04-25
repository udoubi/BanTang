//
//  UserInfoData.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UserInfoData.h"

@implementation UserInfoData
+ (void)loaduUserData:(Completelock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"userinfo" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    UserInfoData *userData = [UserInfoData mj_objectWithKeyValues:dic[@"data"]];
    complete(userData,nil);
}
@end
