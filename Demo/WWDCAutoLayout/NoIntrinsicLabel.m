//
//  NoIntrinsicLabel.m
//  WWDCAutoLayout
//
//  Created by 张晓珊 on 2018/7/30.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

#import "NoIntrinsicLabel.h"

@implementation NoIntrinsicLabel

- (CGSize)intrinsicContentSize {
    return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
}

@end
