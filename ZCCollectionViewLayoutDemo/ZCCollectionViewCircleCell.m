//
//  ZCCollectionViewCircleCell.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/7.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "ZCCollectionViewCircleCell.h"
#import "UIColor+random.h"

@implementation ZCCollectionViewCircleCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 35.0;
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor random].CGColor;
        self.contentView.backgroundColor = [UIColor random];
    }
    return self;
}

@end
