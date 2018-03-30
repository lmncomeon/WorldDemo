//
//  RichTextViewController.m
//  WorldDemo
//
//  Created by Cindy on 2018/3/30.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import "RichTextViewController.h"

@interface RichTextViewController ()
<UITextViewDelegate>

@end

@implementation RichTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *str = @"策划783011062@qq.comre书策划书策划2书策\n划书策划书4策划书策划书\n啊大叔《大时代》打算《撒的阿斯顿啊》";
    
    // textView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 0)];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    textView.allowsEditingTextAttributes = NO;
    textView.dataDetectorTypes = UIDataDetectorTypeAll;
    textView.delegate = self;
    textView.attributedText = [self attrWithString:str font:12 textColor:[UIColor blackColor] paragraphSpacing:10 specialArray:@[
                                                                                                                                 @{@"text" : @"4", @"font" : @13, @"textColor" : [UIColor greenColor]},
                                                                                                                                 @{@"text" : @"《大时代》", @"font" : @18, @"textColor" : [UIColor purpleColor], @"url" : @"dashidai://"},
                                                                                                                                 @{@"text" : @"《撒的阿斯顿啊》", @"font" : @18, @"textColor" : [UIColor orangeColor], @"url" : @"123://"}
                                                                                                                                 ]];
    textView.textAlignment = 1;
    textView.linkTextAttributes = @{NSForegroundColorAttributeName : [UIColor purpleColor]};
    [self.view addSubview:textView];
    
    CGFloat attrH = [MNCalculateSize heightForString:textView andWidth:textView.bounds.size.width];
    
    CGRect textViewF = textView.frame;
    textViewF.size.height = attrH;
    textView.frame = textViewF;
}

- (void)method1
{
    NSString *str = @"策划书策划书策划书策\n划书策划书策划书策划书\n啊大叔《大时代》打算";
    
    // attr
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.paragraphSpacing = 5;
    paragraphStyle.alignment = 1;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor grayColor], NSParagraphStyleAttributeName : paragraphStyle}];
    
    [attr addAttribute:NSLinkAttributeName value:@"dashidai://" range:[[attr string] rangeOfString:@"《大时代》"]];
    
    // textView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width, 0)];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    textView.delegate = self;
    textView.attributedText = attr;
    textView.textAlignment = 1;
    textView.linkTextAttributes = @{NSForegroundColorAttributeName : [UIColor purpleColor]};
    [self.view addSubview:textView];
    
    CGFloat attrH = [MNCalculateSize heightForString:textView andWidth:textView.bounds.size.width];
    
    CGRect textViewF = textView.frame;
    textViewF.size.height = attrH;
    textView.frame = textViewF;
    
    
    
    NSMutableAttributedString *attr2 = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName : [UIColor clearColor], NSFontAttributeName : textView.font, NSParagraphStyleAttributeName : paragraphStyle}];
    
    [attr2 addAttribute:NSLinkAttributeName value:@"dashidai://" range:[[attr2 string] rangeOfString:@"《大时代》"]];
    
    UITextView *text2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 4, CGRectGetWidth(textView.frame), CGRectGetHeight(textView.frame))];
    text2.backgroundColor = [UIColor clearColor];
    text2.editable = NO;
    text2.scrollEnabled = NO;
    text2.userInteractionEnabled = NO;
    text2.attributedText = attr2;
    text2.textAlignment = 1;
    text2.linkTextAttributes = @{
                                 
                                 NSUnderlineColorAttributeName  : [UIColor purpleColor],
                                 NSUnderlineStyleAttributeName  : @(NSUnderlineStyleSingle)
                                 
                                 };
    [textView addSubview:text2];
}

/**
 @param specialArray @[@{text : text, font:font, textColor : textColor, url:url}]
 */
- (NSMutableAttributedString *)attrWithString:(NSString *)str
                                         font:(CGFloat)font
                                    textColor:(UIColor *)textColor
                             paragraphSpacing:(CGFloat)paragraphSpacing
                                 specialArray:(NSArray *)specialArray
{
    
    // attr
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.paragraphSpacing = paragraphSpacing;
    paragraphStyle.alignment = 1;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font], NSForegroundColorAttributeName : textColor, NSParagraphStyleAttributeName : paragraphStyle}];
    
    for (NSDictionary *dic in specialArray) {
        NSString *text = @"";
        
        if (dic[@"text"]) {
            text = dic[@"text"];
        }
        
        if (dic[@"font"]) {
            UIFont *font = [UIFont systemFontOfSize:[dic[@"font"] floatValue]];
            
            [attr addAttribute:NSFontAttributeName value:font range:[[attr string] rangeOfString:text]];
        }
        
        if (dic[@"textColor"]) {
            UIColor *textColor = dic[@"textColor"];
            
            [attr addAttribute:NSForegroundColorAttributeName value:textColor range:[[attr string] rangeOfString:text]];
        }
        
        if (dic[@"url"]) {
            NSString *url = dic[@"url"];
            
            [attr addAttribute:NSLinkAttributeName value:url range:[[attr string] rangeOfString:text]];
        }
        
    }
    
    return attr;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    
    
    if ([[URL scheme] isEqualToString:@"dashidai"])
    {
        
        return NO;
    }
    else if ([[URL scheme] isEqualToString:@"123"])
    {
        return NO;
    }
    
    return YES;
}

@end
