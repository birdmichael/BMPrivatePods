#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BMCommonMacro.h"
#import "BMMethodSwizzling.h"
#import "NSArray+SafeNil.h"
#import "NSDictionary+SafeNil.h"
#import "NSMutableArray+SafeNil.h"
#import "NSMutableDictionary+SafeNil.h"
#import "UIColor+BMGradient.h"
#import "UIColor+BMHEX.h"
#import "UIColor+BMRandom.h"
#import "UIColorHeader.h"
#import "UIScreen+BMFrame.h"

FOUNDATION_EXPORT double BMPrivatePodsVersionNumber;
FOUNDATION_EXPORT const unsigned char BMPrivatePodsVersionString[];

