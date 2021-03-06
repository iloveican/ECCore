// --------------------------------------------------------------------------
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import <Foundation/Foundation.h>

// In theory we could get away with using id and not passing in the class name, but by passing it in
// we get a bit more type checking.

#define EC_SINGLETON(className) \
    + (className*)sharedInstance

#define EC_SYNTHESIZE_SINGLETON(className) \
    + (className*)sharedInstance \
    { \
        static id instance = nil; \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ instance = [[className alloc] init]; } ); \
        return instance; \
    }

@interface ECSingleton : NSObject

@end
