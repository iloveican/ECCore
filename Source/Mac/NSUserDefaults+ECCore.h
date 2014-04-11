// --------------------------------------------------------------------------
//
//  Copyright 2014 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

@interface NSUserDefaults(ECCore)

// --------------------------------------------------------------------------
// Public Methods
// --------------------------------------------------------------------------

- (NSFont*) fontForKey: (NSString*) key;
- (void) setFont: (NSFont*) font forKey: (NSString*) key;

@end
