//
//  PhotoCollectionView.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"
#import "ZLPhotoTool.h"
#import "PhotoSelectedModel.h"

static NSString *const cellId = @"photoCell";
static CGFloat const kDefaultMargin = 3;
@interface PhotoCollectionView()<UICollectionViewDataSource>
@property (nonatomic,assign) CGFloat itemWidth;
@end

@implementation PhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:cellId];
    }
    return self;
}
- (CGFloat)itemWidth {
    return ([UIScreen mainScreen].bounds.size.width- 4 * kDefaultMargin) / 3;
}
#pragma tableView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assetArray.count + 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.image = [UIImage imageNamed:@"BoAssetsCamera"];
    }else {
        PHAsset *asset = self.assetArray[indexPath.row - 1];
        cell.statusImageView.hidden = YES;
        CGSize size = CGSizeMake(self.itemWidth * 2, self.itemWidth * 2);
        [[ZLPhotoTool sharePhotoTool] requestImageForAsset:asset size:size resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image) {
            cell.image = image;
            for (PhotoSelectedModel * selectedModel in self.selectedModelArray) {
                if ([asset.localIdentifier isEqualToString:selectedModel.identifier]) {
                    cell.statusImageView.hidden = NO;
                    break;
                }
            }
        }];
    }

    return cell;
}
- (void)setAssetArray:(NSArray<PHAsset *> *)assetArray {
    _assetArray = assetArray;
    dispatch_async(dispatch_get_main_queue(), ^{
       [self reloadData]; 
    });
}
@end
