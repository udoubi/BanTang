//
//  HomeCell.h
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeData.h"

@interface HomeCell : UITableViewCell

@property (nonatomic,strong) HomeDataElemen *topic;
@property (nonatomic,assign) CGFloat height;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
