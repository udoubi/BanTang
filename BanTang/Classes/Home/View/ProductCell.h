//
//  ProductCell.h
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicDetailData.h"
@interface ProductCell : UITableViewCell
@property (nonatomic,strong) ProductDetail *product;
@property (nonatomic,strong) NSString *picUrlHost;
@property (nonatomic,strong) NSString *userAvatrHost;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
