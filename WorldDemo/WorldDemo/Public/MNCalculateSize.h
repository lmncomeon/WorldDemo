//
//  MNCalculateSize.h
//  WorldDemo
//
//  Created by Cindy on 2018/3/30.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MNCalculateSize : NSObject

/** 计算textView高度 */
+ (float)heightForString:(UITextView *)textView andWidth:(float)width;

@end
