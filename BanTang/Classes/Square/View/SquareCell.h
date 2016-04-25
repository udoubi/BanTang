//
//  SquareCell.h
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareData.h"

@interface SquareCell : UITableViewCell

@property (nonatomic,strong) SquareGroup *group;
+ (instancetype)cellWithTableView:(UITableView *)tableView ;
@end
