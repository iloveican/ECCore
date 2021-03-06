// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


@interface UIColor(ECCore)

+ (UIColor*) blueTextColor;

+ (UIColor *)colorWithIntRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha;

- (BOOL)ecGetRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;

@end
