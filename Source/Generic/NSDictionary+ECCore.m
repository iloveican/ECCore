// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 12/04/2011
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "NSDictionary+ECCore.h"


@implementation NSDictionary(ECCore)

// --------------------------------------------------------------------------
//! If a given key is in the dictionary, place its value into a bool variable.
// --------------------------------------------------------------------------

- (id) valueForKey: (NSString*) key intoBool: (BOOL*) valueOut
{
	id value = [self valueForKey: key];
	if (value)
	{
		*valueOut = [value boolValue];
	}
	
	return value;
}

// --------------------------------------------------------------------------
//! If a given key is in the dictionary, place its value into a double variable.
// --------------------------------------------------------------------------

- (id) valueForKey: (NSString*) key intoDouble: (double*) valueOut
{
	id value = [self valueForKey: key];
	if (value)
	{
		*valueOut = [value doubleValue];
	}
	
	return value;
}

// --------------------------------------------------------------------------
//! Return a dictionary identical to this except without a given key.
// --------------------------------------------------------------------------

- (NSDictionary*)dictionaryWithoutKey:(NSString*)key
{
    id object = [self objectForKey:key];
    if (object)
    {
        NSMutableDictionary* copy = [[self mutableCopy] autorelease];
        [copy removeObjectForKey:key];
        return copy;
    }
    else
    {
        return self;
    }
}

// --------------------------------------------------------------------------
//! Return a point from a given dictionary key.
//! The key is assumed to contain an array with two double values in it.
// --------------------------------------------------------------------------

- (CGPoint)pointForKey:(NSString*)key
{
    NSArray* values = [self objectForKey:key];
    CGPoint result = CGPointMake((CGFloat)[[values objectAtIndex:0] doubleValue], (CGFloat)[[values objectAtIndex:1] doubleValue]);

    return result;
}

// --------------------------------------------------------------------------
//! Return a size from a given dictionary key.
//! The key is assumed to contain an array with two double values in it.
// --------------------------------------------------------------------------

- (CGSize)sizeForKey:(NSString*)key
{
    NSArray* values = [self objectForKey:key];
    CGSize result = CGSizeMake((CGFloat)[[values objectAtIndex:0] doubleValue], (CGFloat)[[values objectAtIndex:1] doubleValue]);
    
    return result;
}

// --------------------------------------------------------------------------
//! Return a rect from a given dictionary key.
//! The key is assumed to contain an array with two double values in it.
// --------------------------------------------------------------------------

- (CGRect)rectForKey:(NSString*)key
{
    NSArray* values = [self objectForKey:key];
    CGRect result = CGRectMake((CGFloat)[[values objectAtIndex:0] doubleValue], (CGFloat)[[values objectAtIndex:1] doubleValue], (CGFloat)[[values objectAtIndex:2] doubleValue], (CGFloat)[[values objectAtIndex:3] doubleValue]);
    
    return result;
}

@end


@implementation NSMutableDictionary(ECCore)

// --------------------------------------------------------------------------
//! Store a point in a dictionary under a given key.
//! The point is stored as an array with two double values in it.
// --------------------------------------------------------------------------

- (void)setPoint:(CGPoint)point forKey:(NSString*)key
{
    NSArray* values = [NSArray arrayWithObjects:[NSNumber numberWithDouble:point.x], [NSNumber numberWithDouble:point.y], nil];
    [self setObject:values forKey:key];
}

// --------------------------------------------------------------------------
//! Store a point in a dictionary under a given key.
//! The point is stored as an array with two double values in it.
// --------------------------------------------------------------------------

- (void)setSize:(CGSize)size forKey:(NSString*)key
{
    NSArray* values = [NSArray arrayWithObjects:[NSNumber numberWithDouble:size.width], [NSNumber numberWithDouble:size.height], nil];
    [self setObject:values forKey:key];
}

// --------------------------------------------------------------------------
//! Store a point in a dictionary under a given key.
//! The point is stored as an array with two double values in it.
// --------------------------------------------------------------------------

- (void)setRect:(CGRect)rect forKey:(NSString*)key
{
    NSArray* values = [NSArray arrayWithObjects:[NSNumber numberWithDouble:rect.origin.x], [NSNumber numberWithDouble:rect.origin.y], [NSNumber numberWithDouble:rect.size.width], [NSNumber numberWithDouble:rect.size.height], nil];
    [self setObject:values forKey:key];
}

// --------------------------------------------------------------------------
//! Merge the first level of keys in this dictionary with those in another dictionary.
// --------------------------------------------------------------------------

- (void)mergeEntriesFromDictionary:(NSDictionary*)dictionary
{
    for (NSString* key in dictionary)
    {
        id existingItem = [self objectForKey:key];
        id newItem = [dictionary objectForKey:key];
        if (existingItem && newItem)
        {
            if ([existingItem isMemberOfClass:[NSDictionary class]] && [newItem isMemberOfClass:[NSDictionary class]])
            {
                NSMutableDictionary* merged = [NSMutableDictionary dictionaryWithDictionary:existingItem];
                [merged addEntriesFromDictionary:newItem];
                newItem = merged;
            }
        }
        
        if (newItem)
        {
            [self setObject:newItem forKey:key];
        }
    }

}
@end
