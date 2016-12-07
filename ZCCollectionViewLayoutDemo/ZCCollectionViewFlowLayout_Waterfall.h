//
//  ZCCollectionViewFlowLayout_Waterfall.h
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCollectionViewFlowLayout_Waterfall : UICollectionViewFlowLayout

@property(nonatomic, assign) CGFloat columnMargin; //列距
@property(nonatomic, assign) CGFloat rowMargin; //行距
@property(nonatomic, assign) NSInteger columnCount; //列数
@property(nonatomic, assign) UIEdgeInsets edgeInsets;

@end
