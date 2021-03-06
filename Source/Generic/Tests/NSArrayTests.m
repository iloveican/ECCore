// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import <ECUnitTests/ECUnitTests.h>
#import <ECCore/ECCore.h>

@interface NSArrayTests : ECTestCase

@end

@implementation NSArrayTests

- (void)testFirstObjectOrNil
{
	ECTestAssertTrue([[NSArray array] firstObjectOrNil] == nil);
	ECTestAssertStringIsEqual([[NSArray arrayWithObject:@"test"] firstObjectOrNil], @"test");
	
	NSArray* array = [NSArray arrayWithObjects:@"test1", @"test2", nil];
	ECTestAssertStringIsEqual([array firstObjectOrNil], @"test1");
}

- (void)testRandomize
{
	NSMutableArray* array = [NSMutableArray array];
	[array randomize];
	ECTestAssertIsEmpty(array);
	
	[array addObject:@"test"];
	[array randomize];
	ECTestAssertStringIsEqual([array objectAtIndex:0], @"test");
}

@end
