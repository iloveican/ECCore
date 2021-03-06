// --------------------------------------------------------------------------
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "ECLazyProperties.h"

#import <objc/runtime.h>

@implementation NSObject(ECLazyProperties)

+ (void)initializeLazyProperties
{
    uint count;
    objc_property_t* properties = class_copyPropertyList(self, &count);
    for (uint i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        SEL init = NSSelectorFromString([NSString stringWithFormat:@"%sInit__", propertyName]);
        if ([self instancesRespondToSelector:init])
        {
            SEL getter = NSSelectorFromString([NSString stringWithFormat:@"%s", propertyName]);
            Method initMethod = class_getInstanceMethod(self, init);
            Method getterMethod = class_getInstanceMethod(self, getter);
            
            method_exchangeImplementations(initMethod, getterMethod);
        }
    }
    free(properties);
}

@end

