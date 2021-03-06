// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const ECFontNameKey;
extern NSString *const ECFontSizeKey;

@interface UIFont(ECCore)

+ (UIFont*)fontFromDictionary:(NSDictionary*)dictionary;
- (UIFont*)fontFromDictionary:(NSDictionary*)dictionary;

- (NSDictionary*)asDictionary;

- (UIFont*)boldVariant;
- (UIFont*)italicVariant;

@end
