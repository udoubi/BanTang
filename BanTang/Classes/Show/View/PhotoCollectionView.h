//
//  PhotoCollectionView.h
//  PhotoDemo
//
//  Created by 江科 on 16/4/21.
//  Copyright © 2016年 江科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface PhotoCollectionView : UICollectionView

@property (nonatomic,strong) NSArray<PHAsset *> *assetArray;

@property (nonatomic,strong) NSArray *selectedModelArray;;
@end
