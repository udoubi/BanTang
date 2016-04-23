//
//  PhotoSelectedModel.h
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface PhotoSelectedModel : NSObject
@property (nonatomic,copy) NSString *identifier;
@property (nonatomic,strong) PHAsset *asset;
- (instancetype)initWithAsset:(PHAsset *)asset identifier:(NSString *)identifier;
@end
