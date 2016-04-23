//
//  SquareData.m
//  BanTang
//
//  Created by 江科 on 16/4/23.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareData.h"

@implementation SquareData

+ (void)loadSquareData:(Completelock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"community_data" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    SquareData *squareData = [SquareData mj_objectWithKeyValues:dic[@"data"]];
    complete(squareData,nil);
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"rec_groups":NSStringFromClass([SquareGroup class]),
             @"module_elements":NSStringFromClass([SquareChannel class])
             };
}
@end

@implementation SquareGroup



@end

@implementation SquareChannel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"elements":NSStringFromClass([SquareChannelItem class])};
}

@end

@implementation SquareChannelItem



@end