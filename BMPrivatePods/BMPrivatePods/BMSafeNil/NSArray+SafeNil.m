//
//  NSArray+SafeNil.m
//  BMPrivatePods
//
//  Created by BirdMichael on 2018/9/25.
//

#import "NSArray+SafeNil.h"
#import "BMMethodSwizzling.h"

//#ifdef DEBUG
//#else

@implementation NSArray (SafeNil)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BMExchangeClassMethods([self class], @selector(objectAtIndex:), @selector(bm_objectAtIndexI:));
        BMExchangeClassMethods([self class], @selector(arrayWithObjects:count:), @selector(bm_arrayWithObjects:count:));
    });
}

- (id)bm_objectAtIndexI:(NSUInteger)index {
    if (index >= self.count) {
    #if DEBUG
        NSLog(@"[%@ %@] index {%lu} beyond bounds [0...%lu]",
              NSStringFromClass([self class]),
              NSStringFromSelector(_cmd),
              (unsigned long)index,
              MAX((unsigned long)self.count - 1, 0));
    #endif
        return nil;
    }
    
    return [self bm_objectAtIndexI:index];
}

+ (id)bm_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    id validObjects[cnt];
    NSUInteger count = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (objects[i]) {
            validObjects[count] = objects[i];
            count++;
        }
        else {
    #if DEBUG
            NSLog(@"[%@ %@] NIL object at index {%lu}",
                  NSStringFromClass([self class]),
                  NSStringFromSelector(_cmd),
                  (unsigned long)i);
    #endif
            
        }
    }
    
    return [self bm_arrayWithObjects:validObjects count:count];
}

@end

//#endif