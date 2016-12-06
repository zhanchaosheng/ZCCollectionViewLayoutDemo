//
//  ZCCollectionSectionHeaderView.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ZCCollectionSectionHeaderView.h"

@implementation ZCCollectionSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.9];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 6, 150, 30)];
        [self addSubview:_title];
    }
    return self;
}

@end
