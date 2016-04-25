//
//  UserInfoData.h
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoData : NSObject
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *avatar;
@property (nonatomic,copy) NSString *user_sign;
@property (nonatomic,copy) NSString *user_cover;
@property (nonatomic,copy) NSString *attention_type;
@property (nonatomic,copy) NSString *attentions;
@property (nonatomic,copy) NSString *fans;
@property (nonatomic,copy) NSString *credits;
@property (nonatomic,copy) NSString *post_like;
@property (nonatomic,copy) NSString *post_rec;
@property (nonatomic,copy) NSString *badge_url;
@property (nonatomic,copy) NSString *badges;

+ (void)loaduUserData:(Completelock)complete;
@end
