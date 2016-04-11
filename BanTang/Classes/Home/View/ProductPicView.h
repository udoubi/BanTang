//
//  ProductPicView.h
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicDetailData.h"

@interface ProductPicView : UIView

@property (nonatomic,strong) NSArray<PicModel *> *images;
@property (nonatomic,strong) NSString *picUrlHost;
@end
