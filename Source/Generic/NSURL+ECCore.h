// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

@interface NSURL(ECCore)

ECDeclareDebugChannel(NSURLChannel);

+ (NSURL*) URLWithResourceNamed: (NSString*) name ofType: (NSString*) type;
- (id) initWithResourceNamed: (NSString*) name ofType: (NSString*) type;
- (NSURL*)getUniqueFileWithName:(NSString*)name andExtension:(NSString*)extension;
- (NSURL*)getUniqueFileWithName:(NSString*)name andExtension:(NSString*)extension usingManager:(NSFileManager*)fileManager;

@end

// These routines are implemented differently on each platform.
// The implementations can be found in NSURL+ECCoreMac.h or NSURL+ECCoreIOS.h
@interface NSURL(ECCorePlatform)
- (NSURL*)URLByResolvingLinksAndAliases;
@end
