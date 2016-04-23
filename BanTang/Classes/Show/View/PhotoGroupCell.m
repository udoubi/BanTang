//
//  PhotoGroupCell.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoGroupCell.h"
#import "Masonry.h"

@interface PhotoGroupCell()

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *groupNameLabel;
@property (nonatomic,strong) UILabel *groupCountLabel;

@end


@implementation PhotoGroupCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *headImageView = [[UIImageView alloc]init];
        UILabel *groupNameLabel = [[UILabel alloc]init];
        groupNameLabel.font = [UIFont systemFontOfSize:13];
        [groupNameLabel sizeToFit];
        UILabel *groupCountLabel = [[UILabel alloc]init];
        groupCountLabel.font = [UIFont systemFontOfSize:12];
        groupCountLabel.textColor = [UIColor lightGrayColor];
        [groupNameLabel sizeToFit];
        
        [self addSubview:headImageView];
        [self addSubview:groupNameLabel];
        [self addSubview:groupCountLabel];
        
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.leading.top.equalTo(self).offset(10);
        }];
        [groupNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(headImageView).offset(-10);
            make.leading.equalTo(headImageView.mas_trailing).offset(10);
        }];
        [groupCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(headImageView).offset(10);
            make.leading.equalTo(groupNameLabel);
        }];
        
        self.headImageView = headImageView;
        self.groupNameLabel = groupNameLabel;
        self.groupCountLabel = groupCountLabel;
    }
    return self;
}
- (void)setPhotoAblum:(ZLPhotoAblumList *)photoAblum {
    [[ZLPhotoTool sharePhotoTool] requestImageForAsset:photoAblum.headImageAsset size:CGSizeMake(160, 160) resizeMode:PHImageRequestOptionsResizeModeNone completion:^(UIImage *image) {
        self.headImageView.image = image;
    }];
    self.groupNameLabel.text = photoAblum.title;
    self.groupCountLabel.text = [NSString stringWithFormat:@"%ld张",photoAblum.count];
}


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    PhotoGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[PhotoGroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
