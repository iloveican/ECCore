// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

@interface NSArray(ECCore)

- (id)firstObjectOrNil;
- (id)lastObjectOrNil;

@end


@interface NSMutableArray(ECCore)

- (void)randomize;
- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

@end
