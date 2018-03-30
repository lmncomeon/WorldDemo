//
//  ViewModel.h
//  WorldDemo
//
//  Created by Cindy on 2018/3/30.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className;

- (instancetype)initWithTitle:(NSString *)title className:(NSString *)className;

@end
