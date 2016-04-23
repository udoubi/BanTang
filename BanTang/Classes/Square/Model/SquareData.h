//
//  SquareData.h
//  BanTang
//
//  Created by 江科 on 16/4/23.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserRecomendData.h"
@class SquareGroup;
@class SquareChannel;
@class SquareChannelItem;

@interface SquareData : NSObject
@property (nonatomic,strong) NSArray<SquareGroup *> *rec_groups;
@property (nonatomic,strong) NSArray<SquareChannel *> *module_elements;

+ (void)loadSquareData:(Completelock)complete;
@end

@interface SquareGroup : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pic2;
@property (nonatomic,strong) DynamicModel *dynamic;
@end
@interface SquareChannel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray<SquareChannelItem *> *elements;
@end
@interface SquareChannelItem : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sub_title;
@property (nonatomic,copy) NSString *photo;
@end
