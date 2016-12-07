//
//  ZCCollectionCircleViewController.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/7.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ZCCollectionCircleViewController.h"
#import "ZCCollectionViewCircleCell.h"
#import "ZCCollectionViewCircleLayout.h"

static NSString * const cellIdentifier = @"MY_CELL";

@interface ZCCollectionCircleViewController ()
@property (nonatomic, assign) NSInteger cellCount;
@end

@implementation ZCCollectionCircleViewController

- (instancetype)init {
    ZCCollectionViewCircleLayout *layout = [[ZCCollectionViewCircleLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Circle Layout";
    self.cellCount = 20;
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    [self.collectionView registerClass:[ZCCollectionViewCircleCell class]
            forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView reloadData];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    ZCCollectionViewCircleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                                 forIndexPath:indexPath];
    return cell;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath != nil)
        {
            self.cellCount = self.cellCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:@[tappedCellPath]];
                
            } completion:nil];
        }
        else
        {
            self.cellCount = self.cellCount + 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}


@end
