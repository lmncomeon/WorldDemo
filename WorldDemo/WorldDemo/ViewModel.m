//
//  ViewModel.m
//  WorldDemo
//
//  Created by Cindy on 2018/3/30.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)initWithTitle:(NSString *)title className:(NSString *)className
{
    self = [super init];
    if (self) {
        self.title = title;
        self.className = className;
    }
    return self;
}

@end
