//
//  leftViewController.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "leftViewController.h"
#import "ZCCollectionViewFlowLayout_Hover.h"
#import "ZCCollectionViewCell.h"
#import "ZCCollectionSectionHeaderView.h"
#import "UIColor+random.h"

@interface leftViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation leftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"sectionHeader悬停";
    
    ZCCollectionViewFlowLayout_Hover *viewLayout = [[ZCCollectionViewFlowLayout_Hover alloc] init];
    viewLayout.minimumLineSpacing = 3;
    viewLayout.minimumInteritemSpacing = 0;
    viewLayout.sectionInset = UIEdgeInsetsMake(0, 4, 4, 4);
    CGRect rect = self.view.bounds;
    CGFloat cellWidth = (rect.size.width-20)/4;
    CGFloat cellHeight = cellWidth;
    viewLayout.itemSize = CGSizeMake(cellWidth, cellHeight);
    viewLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 40);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:viewLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[ZCCollectionViewCell class]
            forCellWithReuseIdentifier:@"ZCCollectionViewCell"];
    [self.collectionView registerClass:[ZCCollectionSectionHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"reusableViewIdentifier"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCollectionViewCell *cellView =
    (ZCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ZCCollectionViewCell"
                                                                      forIndexPath:indexPath];
    
    cellView.backgroundColor = [UIColor random];
    
    return cellView;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    ZCCollectionSectionHeaderView *headerView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"reusableViewIdentifier"
                                              forIndexPath:indexPath];
    headerView.title.text = [NSString stringWithFormat:@"section:%ld",indexPath.section];
    return headerView;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
