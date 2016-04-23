//
//  PhotoGroupCell.h
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPhotoTool.h"

@interface PhotoGroupCell : UITableViewCell

@property (nonatomic,strong) ZLPhotoAblumList *photoAblum;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
