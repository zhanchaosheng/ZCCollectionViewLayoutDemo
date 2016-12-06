//
//  ZCCollectionViewCell.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/6.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ZCCollectionViewCell.h"

@implementation ZCCollectionViewCell

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        [self addSubview:_titel];
        
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
