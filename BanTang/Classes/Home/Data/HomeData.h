//
//  HomeData.h
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeData : NSObject

@property (nonatomic,strong) NSArray *topics;
@property (nonatomic,strong) NSArray *categories;
@property (nonatomic,strong) NSArray *hotItems;
@property (nonatomic,strong) NSArray *banners;

+ (void)loadHomeData:(Completelock)complete ;
@end


@interface HomeDataElemen : NSObject

@property (nonatomic,copy) NSString *hid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sub_title;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *photo;
@property (nonatomic,copy) NSString *is_show_like;
@property (nonatomic,copy) NSString *likes;
@property (nonatomic,copy) NSString *pic;

@end
