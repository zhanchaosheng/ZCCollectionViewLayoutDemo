//
//  ViewController.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ViewController.h"
#import "ZCCollectionViewFlowLayout_Hover.h"
#import "ZCCollectionViewCell.h"
#import "UIColor+random.h"
#import "ZCCollectionCircleViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"顶部cell悬停";
    
    ZCCollectionViewFlowLayout_Hover *viewLayout = [[ZCCollectionViewFlowLayout_Hover alloc] init];
    viewLayout.hoverTopCell = YES; //顶层cell悬停
    viewLayout.itemSize = CGSizeMake(self.view.bounds.size.width, 100);
    viewLayout.minimumLineSpacing = -20; //行间距设置为一个负数就能建立起互相叠加的效果
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

- (IBAction)CircleItemBtnClicked:(id)sender {
    ZCCollectionCircleViewController *circleLayoutVC = [[ZCCollectionCircleViewController alloc] init];
    [self.navigationController pushViewController:circleLayoutVC animated:YES];
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
    
    cellView.titel.text = [NSString stringWithFormat:@"titel: %ld",indexPath.item];
    
    return cellView;
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
