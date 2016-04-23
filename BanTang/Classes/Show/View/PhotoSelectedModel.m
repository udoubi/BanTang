//
//  PhotoSelectedModel.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoSelectedModel.h"

@implementation PhotoSelectedModel
- (instancetype)initWithAsset:(PHAsset *)asset identifier:(NSString *)identifier {
    if (self = [super init]) {
        self.asset = asset;
        self.identifier = identifier;
    }
    return self;
}
@end
