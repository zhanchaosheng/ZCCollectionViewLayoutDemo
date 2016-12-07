//
//  rightViewController.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "rightViewController.h"
#import "ZCCollectionViewCell.h"
#import "UIColor+random.h"
#import "ZCCollectionViewFlowLayout_Waterfall.h"

@interface rightViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation rightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"瀑布流";
    
    ZCCollectionViewFlowLayout_Waterfall *viewLayout = [[ZCCollectionViewFlowLayout_Waterfall alloc] init];
    viewLayout.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:viewLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[ZCCollectionViewCell class]
            forCellWithReuseIdentifier:@"ZCCollectionViewCell"];
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
    return 30;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCCollectionViewCell *cellView =
    (ZCCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ZCCollectionViewCell"
                                                                      forIndexPath:indexPath];

    cellView.backgroundColor = [UIColor random];
    
    return cellView;
}

- (NSNumber *)heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 50 + arc4random_uniform(101);
    return @(height);
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
