//
//  PhotoController.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/19.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoController.h"
#import "Masonry.h"
#import "PhotoCell.h"
#import "ZLPhotoTool.h"
#import "TitleButton.h"
#import "PhotoGroupView.h"
#import <Photos/Photos.h>
#import "ZLPhotoTool.h"
#import "PhotoCollectionView.h"
#import "PhotoSelectedModel.h"
static CGFloat const DefaultMargin = 3;
static CGFloat const kPhotoGroupViewHeight = 280;
@interface PhotoController ()<UICollectionViewDelegate,UITableViewDelegate>
@property (nonatomic,strong) PhotoCollectionView *collectionView;
@property (nonatomic,strong) PhotoGroupView *photoGroupView;
@property (nonatomic,strong) UIView *bgMaskView;
@property (nonatomic,strong) NSArray<ZLPhotoAblumList *> *ablumList;
@property (nonatomic,strong) NSArray<PHAsset *> *assetArray;
@property (nonatomic,strong) TitleButton *titleButton;
@property (nonatomic,strong) NSMutableArray *selectedModellArray;
@end

@implementation PhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationBar];
    [self buildCollectionView];
    [self buildPhotoGroupView];
    [self loadata];
}
#pragma build views
- (void)buildNavigationBar {
    TitleButton *button = [[TitleButton alloc]initWithFrame:CGRectMake(0, 100, 100, 20)];
    [button setTitle:@"相机胶卷" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"BoSelectGroup_tip"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectBtnCliked:) forControlEvents:UIControlEventTouchUpInside];
    button.selected = NO;
    self.navigationItem.titleView = button;
    self.titleButton = button;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton sizeToFit];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelButton addTarget:self action:@selector(cancelCliked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cancelButton];
}
- (void)buildCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(self.itemWidth, self.itemWidth);
    layout.minimumInteritemSpacing = DefaultMargin;
    layout.minimumLineSpacing = DefaultMargin;
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    collectionView.contentInset = UIEdgeInsetsMake(DefaultMargin, DefaultMargin, DefaultMargin, DefaultMargin);
    self.collectionView = collectionView;
}
- (void)buildPhotoGroupView {
    self.photoGroupView = [[PhotoGroupView alloc]initWithFrame:CGRectMake(0, -kPhotoGroupViewHeight + 64, Width, kPhotoGroupViewHeight)];
    self.photoGroupView.delegate = self;
    [self.view addSubview:self.photoGroupView];
}
- (CGFloat)itemWidth {
    return (Width - 4 * DefaultMargin) / 3;
}
- (NSMutableArray *)selectedModellArray {
    if (_selectedModellArray == nil) {
        _selectedModellArray = [NSMutableArray array];
    }
    return _selectedModellArray;
}
#pragma mark - 遮罩背景
- (UIView *)bgMaskView {
    if (_bgMaskView == nil) {
        UIView *bgMaskView = [[UIView alloc] init];
        bgMaskView.alpha = 0.4;
        bgMaskView.backgroundColor = [UIColor blackColor];
        bgMaskView.userInteractionEnabled = YES;
        [bgMaskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgMaskView:)]];
        bgMaskView.frame = self.view.bounds;
        _bgMaskView = bgMaskView;
    }
    return _bgMaskView;
}
- (void)loadata {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusAuthorized) {
            self.assetArray = [[ZLPhotoTool sharePhotoTool] getAllAssetInPhotoAblumWithAscending:NO];
            self.ablumList = [[ZLPhotoTool sharePhotoTool] getPhotoAblumList];
        }
    }];
}
- (void)setAssetArray:(NSArray<PHAsset *> *)assetArray {
    _assetArray = assetArray;
    self.collectionView.assetArray = assetArray;
}
- (void)setAblumList:(NSArray<ZLPhotoAblumList *> *)ablumList {
    _ablumList = ablumList;
    self.photoGroupView.ablumList = ablumList;
}
#pragma tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLPhotoAblumList *ablum = self.ablumList[indexPath.row];
    self.assetArray = [[ZLPhotoTool sharePhotoTool] getAssetsInAssetCollection:ablum.assetCollection ascending:YES];
    self.titleButton.selected = NO;
    [self.titleButton setTitle:ablum.title forState:UIControlStateNormal];
    [self showPhotoGroupView:NO];
}
#pragma collectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *ctr = [[UIImagePickerController alloc]init];
            ctr.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:ctr animated:YES completion:nil];
        }else {
            NSLog(@"不支持相机");
        }
        
    }else{
        BOOL isAdded = NO;
        PHAsset *asset = self.assetArray[indexPath.row - 1];
        for (PhotoSelectedModel *selectedModel in self.selectedModellArray) {
            if ([selectedModel.identifier isEqualToString:asset.localIdentifier]) {
                [self.selectedModellArray removeObject:selectedModel];
                isAdded = YES;
                break;
            }
        }
        if (!isAdded) {
            if (self.selectedModellArray.count > self.maxSelectCount) {
                NSLog(@"已达到最大数量");
                return;
            }
            [self.selectedModellArray addObject:[[PhotoSelectedModel alloc]initWithAsset:asset identifier:asset.localIdentifier]];
        }
        PhotoCell *cell = (PhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.statusImageView.hidden = !cell.statusImageView.hidden;
        self.collectionView.selectedModelArray = self.selectedModellArray;
    }
}
#pragma pubic method
- (void)showPhotoGroupView:(BOOL)show {
    if (show) {
        [UIView animateWithDuration:0.3 animations:^{
            self.photoGroupView.frame = CGRectMake(0, 64, Width, kPhotoGroupViewHeight);
        }];
        [self.view insertSubview:self.bgMaskView aboveSubview:self.collectionView];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            self.photoGroupView.frame = CGRectMake(0, -kPhotoGroupViewHeight + 64, Width, kPhotoGroupViewHeight);
        }];
        [self.bgMaskView removeFromSuperview];
    }
}

#pragma calback

- (void)selectBtnCliked:(TitleButton *)button {
    button.selected = !button.selected;
    [self showPhotoGroupView:button.selected];
}
- (void)tapBgMaskView:(UITapGestureRecognizer *)tap {
    self.titleButton.selected = NO;
    [self showPhotoGroupView:NO];
}
- (void)cancelCliked {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
