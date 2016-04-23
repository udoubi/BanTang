//
//  PhotoGroupView.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoGroupView.h"
#import "ZLPhotoTool.h"
#import "PhotoGroupCell.h"

@interface PhotoGroupView()<UITableViewDataSource>
@end
@implementation PhotoGroupView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rowHeight = 70;
        self.dataSource = self;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ablumList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoGroupCell *cell = [PhotoGroupCell cellWithTableView:tableView];
    cell.photoAblum = self.ablumList[indexPath.row];
    return cell;
}

- (void)setAblumList:(NSArray *)ablumList {
    _ablumList = ablumList;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
    });
}

@end
