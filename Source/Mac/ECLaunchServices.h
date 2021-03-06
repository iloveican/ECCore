// --------------------------------------------------------------------------
//
//! @file Additional utilities for working with Launch Services.
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import <Foundation/Foundation.h>


@interface ECLaunchServices : NSObject 

+ (BOOL)willOpenAtLogin:(NSURL*)itemURL;
+ (void)setOpenAtLogin:(NSURL*)itemURL enabled: (BOOL) enabled;

@end
