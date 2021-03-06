// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "NSData+ECCore.h"

@implementation NSData(ECUtilities)

#pragma mark - Prototypes

static unsigned char nibbleToHexChar(unsigned char nibble);

#pragma mark - Internal Utilities

// --------------------------------------------------------------------------
//! Return a hex character (0-9 / A-F), given a nibble
// --------------------------------------------------------------------------

unsigned char nibbleToHexChar(unsigned char nibble)
{
	if (nibble < 10)
	{
		return '0' + nibble;
	}
	else
	{
		return 'A' - 10 + nibble;
	}

}

#pragma mark - Public Methods

// --------------------------------------------------------------------------
//! Return a hex encoded string of the data.
// --------------------------------------------------------------------------

- (NSString*) hexString
{
	NSUInteger length = [self length];
	const unsigned char* buffer = [self bytes];
	NSMutableString* string = [[NSMutableString alloc] initWithCapacity: length * 2];
	
	for (NSUInteger n = 0; n < length; ++n)
	{
		const unsigned char digit = buffer[n];
		[string appendString: [NSString stringWithFormat: @"%c%c", nibbleToHexChar(digit >> 4), nibbleToHexChar(digit & 0xF)]];
	}
	
	return [string autorelease];
}

@end
