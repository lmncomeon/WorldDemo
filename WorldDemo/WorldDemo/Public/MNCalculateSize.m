//
//  MNCalculateSize.m
//  WorldDemo
//
//  Created by Cindy on 2018/3/30.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import "MNCalculateSize.h"

@implementation MNCalculateSize

+ (float)heightForString:(UITextView *)textView andWidth:(float)width
{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    
    return sizeToFit.height;
}

@end
