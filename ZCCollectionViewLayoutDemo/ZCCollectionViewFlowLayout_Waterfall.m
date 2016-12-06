//
//  ZCCollectionViewFlowLayout_Waterfall.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ZCCollectionViewFlowLayout_Waterfall.h"

@interface ZCCollectionViewFlowLayout_Waterfall ()
@property(nonatomic, assign) CGFloat contentHeight; //记录布局需要的contentSize的高度
@property(nonatomic, strong) NSMutableArray *columnHeights; //记录各列的当前布局高度
@property(nonatomic, strong) NSMutableArray *attrsArray;
@property(nonatomic, assign) UIEdgeInsets edgeInsets;
@end

@implementation ZCCollectionViewFlowLayout_Waterfall

- (instancetype)init
{
    self = [super init];
    if (self) {
        _columnCount = 3;
        _columnMargin = 6;
        _rowMargin = 6;
        _edgeInsets = UIEdgeInsetsZero;
        _columnHeights = [NSMutableArray array];
        _attrsArray = [NSMutableArray array];
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    //记录布局需要的contentSize的高度
    self.contentHeight = 0;
    //columnHeights数组会记录各列的当前布局高度
    [self.columnHeights removeAllObjects];
    
    //默认高度是sectionEdge.top
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    //清除之前所以的布局属性数据
    [self.attrsArray removeAllObjects];
    //通过数据源拿到需要展示的cell数量
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //开始创建每一个cell对应的布局属性
    for (NSInteger index = 0; index < count; index++) {
        //创建indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        //获取cell布局属性,在layoutAttributesForItemAtIndexPath里面计算具体的布局信息
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //获取一个UICollectionViewLayoutAttributes对象
    UICollectionViewLayoutAttributes *attrs = [super layoutAttributesForItemAtIndexPath:indexPath];
    //列数是3，布局属性的宽度是固定的
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    CGFloat width = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    CGFloat height = 0;//通过数据源以及宽度信息，获取对应位置的布局属性高度;
    //找到数组内目前高度最小的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger index = 1; index < self.columnCount; index++) {
        CGFloat columnHeight = [self.columnHeights[index] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = index;
            break;
        }
    }
    //根据列信息，计算出origin的x
    CGFloat x = self.edgeInsets.left + destColumn * (width +self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {//不是第一行就加上行间距
        y += self.rowMargin;
    }
    //得到布局属性的frame信息
    attrs.frame = CGRectMake(x, y, width, height);
    //更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    //更新记录展示布局所需的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    
    return attrs;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *rArray = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *cacheAttr in self.attrsArray) {
        if (CGRectIntersectsRect(cacheAttr.frame, rect)) {
            [rArray addObject:cacheAttr];
        }
    }
    
    return rArray;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), self.contentHeight + self.edgeInsets.bottom);
}

@end
