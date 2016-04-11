//
//  ProductDetailData.h
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeTopicModel;
@class ProductDetail;
@class PicModel;
@class LikeModel;
@interface TopicDetailData : NSObject
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) HomeTopicModel *data;

+ (void)loadTopicData:(Completelock)complete;
@end

@interface HomeTopicModel : NSObject
@property (nonatomic,copy) NSString *tid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *likes;
@property (nonatomic,copy) NSString *islike;
@property (nonatomic,copy) NSString *tags;
@property (nonatomic,copy) NSString *product_pic_host;
@property (nonatomic,copy) NSString *user_avatr_host;
@property (nonatomic,strong) NSArray<ProductDetail *> *product;
@end

@interface ProductDetail : NSObject
@property (nonatomic,copy) NSString *pid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *comments;
@property (nonatomic,copy) NSString *likes;
@property (nonatomic,copy) NSArray<PicModel *> *pic;
@property (nonatomic,copy) NSArray<LikeModel *> *likes_list;

@end
@interface PicModel : NSObject
@property (nonatomic,copy) NSString *p;
@property (nonatomic,copy) NSString *w;
@property (nonatomic,copy) NSString *h;
@end

@interface LikeModel : NSObject
@property (nonatomic,copy) NSString *u;
@property (nonatomic,copy) NSString *a;

@end

