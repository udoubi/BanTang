//
//  HomeViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeViewController.h"
#import "TitleScrollView.h"
#import "HomeData.h"
#import "HomeHeadView.h"
#import "HomeCollectionCell.h"
#import "UINavigationBar+Extension.h"
#import "HomeScrollView.h"
#import "UIBarButtonItem+Extension.h"
#import "ProductDetailControler.h"
#import "HomePushTransitionAnimator.h"

/** 滚动标题的高度  */
static const CGFloat kTitleVewHeight = 40;
/** 滚动标题每个item的宽度  */
static const CGFloat kTitleViewItemWidth = 64;
/** 焦点按钮与下面的距离  */
static const CGFloat kHotViewMargin = 10;

@interface HomeViewController ()<UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,TitleScrollViewDelegate>
@property (nonatomic,strong) HomeData *homeData;
@property (nonatomic,strong) TitleScrollView *titleView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UICollectionView *mainCollectionView;

@property (nonatomic,strong) HomeScrollView *mainScrollView;
@property (nonatomic,strong) HomeHeadView *headView;
@property (nonatomic, assign) BOOL canScrollViewScroll;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@property (nonatomic, assign) BOOL canTableViewScroll;
/** navigationBar的alpha值 */
@property (nonatomic, assign) CGFloat navigationBarAlpha;

@end

@implementation HomeViewController

#pragma life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationbar];
    [self buildMainScrollView];
    [self loadData];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setElementAlpha:self.navigationBarAlpha];
    self.navigationController.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar zz_reset];
}
#pragma build views
- (void)buildNavigationbar {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"半糖";
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.textColor = [UIColor whiteColor];
    [nameLabel sizeToFit];
    self.navigationItem.titleView = nameLabel;
    
    UIBarButtonItem *searchItem = [UIBarButtonItem barBtnItemWithNmlImg:@"searchBtn" hltImg:@"searchBtn" target:self action:@selector(searchBtnCliked)];
    UIBarButtonItem *signItem = [UIBarButtonItem barBtnItemWithNmlImg:@"SignIn_normal" hltImg:@"SignIn_highLight" target:self action:@selector(searchBtnCliked)];
    self.navigationItem.leftBarButtonItem = searchItem;
    self.navigationItem.rightBarButtonItem = signItem;
}
- (void)buildMainScrollView {
    self.mainScrollView = [[HomeScrollView alloc]init];
    self.mainScrollView.delegate = self;
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    self.contentView = [[UIView alloc]init];
    [self.mainScrollView addSubview:self.contentView];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainScrollView);
        make.width.equalTo(self.mainScrollView);
    }];
}

- (void) buildHeaderView {
    self.headerView = [[UIView alloc]init];
    HomeHeadView *headView = [[HomeHeadView alloc]initWithHomeData:self.homeData];
    headView.frame = CGRectMake(0, 0, Width, headView.height + kHotViewMargin);
    [self.headerView addSubview:headView];

    NSMutableArray *categoryTitles = [NSMutableArray array];
    [self.homeData.categories enumerateObjectsUsingBlock:^(HomeDataElemen *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [categoryTitles addObject:obj.title];
    }];
    self.titleView = [[TitleScrollView alloc]initWithTitleArray:categoryTitles itemWidth:kTitleViewItemWidth];
    self.titleView.delegate = self;
    self.titleView.frame = CGRectMake(0, headView.height + kHotViewMargin, Width, kTitleVewHeight);
    [self.headerView addSubview:self.titleView];
    
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(headView.height + kHotViewMargin + kTitleVewHeight);
    }];
}


- (void)buildCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.mainCollectionView = ({
        UICollectionView *view = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        view.pagingEnabled = YES;
        view.backgroundColor = [UIColor whiteColor];
        view.dataSource = self;
        view.delegate = self;
        view.bounces = NO;
        [view registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeCollectionCell class])];
        view;
    });
    [self.contentView addSubview:self.mainCollectionView];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);
        make.top.equalTo(self.headerView.mas_bottom);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height - NavigationBarHeight- kTitleVewHeight - TabbarBottomHeight);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mainCollectionView);
    }];
    
}

- (void)loadData{
    [HomeData loadHomeData:^(HomeData *data, NSError *error) {
        self.homeData = data;
        [self buildHeaderView];
        [self buildCollectionView];
        
    }];
}


#pragma collectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.homeData.categories.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeCollectionCell class]) forIndexPath:indexPath];
    cell.topics = self.homeData.topics;
    cell.tableView.delegate = self;
    self.currentTableView = cell.tableView;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.mainCollectionView.bounds.size;
}


#pragma tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@",self.navigationController);
    [self.navigationController pushViewController:[ProductDetailControler new] animated:YES];
}
#pragma scrollView delegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        NSInteger index = scrollView.contentOffset.x / Width;
        [self.titleView titleScrollViewScrollTo:index];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        self.mainScrollView.scrollEnabled = NO;
    }
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        if (!self.canTableViewScroll) {
            [scrollView setContentOffset:CGPointZero];
        }
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY<0) {
            self.canScrollViewScroll = YES;
            [scrollView setContentOffset:CGPointZero];
            self.canTableViewScroll = NO;
        }
   
    }
    if ([scrollView isEqual:self.mainScrollView]) {
        self.navigationBarAlpha = scrollView.contentOffset.y /(self.headerView.frame.size.height - NavigationBarHeight - kTitleVewHeight);
        [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
        [self.navigationController.navigationBar zz_setElementAlpha:self.navigationBarAlpha];
        
        
        CGFloat tabOffsetY = self.headerView.frame.size.height - NavigationBarHeight - kTitleVewHeight;
        CGFloat offsetY = scrollView.contentOffset.y;
        _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
        if (offsetY>=tabOffsetY) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            _isTopIsCanNotMoveTabView = YES;
        }else{
            _isTopIsCanNotMoveTabView = NO;
        }
        if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
            if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
                self.canTableViewScroll =YES;
                self.canScrollViewScroll = NO;
            }
            if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){

                if (!self.canScrollViewScroll) {
                    scrollView.contentOffset = CGPointMake(0, tabOffsetY);
                }
            }
        }
    }
    self.mainScrollView.scrollEnabled= YES;
}

#pragma titleScrollView delegate
- (void)didTitleScrollViewCliked:(TitleScrollView *)titleScrollView atIndex:(NSInteger)index {
    [self.mainCollectionView setContentOffset:CGPointMake(Width * index, 0) animated:YES];
}

- (void)searchBtnCliked{}
- (void)signBtnCliked{}
#pragma <UINavigationControllerDelegate> 转场动画相关

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        return [HomePushTransitionAnimator new];
    }
    return nil;
}
@end
