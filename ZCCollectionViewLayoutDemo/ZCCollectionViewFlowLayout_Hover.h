//
//  ZCCollectionViewFlowLayout_Hover.h
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCollectionViewFlowLayout_Hover : UICollectionViewFlowLayout
@property (nonatomic, assign) CGFloat naviHeight;//默认为64.0, default is 64.0
@property (nonatomic, assign) BOOL hoverTopCell; //顶部cell悬停
@end
