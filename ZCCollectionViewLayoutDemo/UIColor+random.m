//
//  UIColor+random.m
//  ZCCollectionViewLayoutDemo
//
//  Created by zcs on 2016/12/7.
//  Copyright © 2016年 zcs. All rights reserved.
//

#import "UIColor+random.h"

@implementation UIColor (random)

+ (UIColor *)random {
    return [UIColor colorWithRed:(CGFloat)arc4random_uniform(256)/255
                           green:(CGFloat)arc4random_uniform(256)/255
                            blue:(CGFloat)arc4random_uniform(256)/255
                           alpha:1.0];
}

@end
