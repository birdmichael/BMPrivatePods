//
//  UIView+BMExtension.m
//  Pods
//
//  Created by BirdMichael on 2018/10/3.
//

#import "UIView+BMExtension.h"

@implementation UIView (BMExtension)
/**
 *  @brief  找到指定类名的view对象
 *
 *  @param clazz view类名
 *
 *  @return view对象
 */
- (id)bm_findSubViewWithSubViewClass:(Class)clazz {
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    
    return nil;
}
/**
 *  @brief  找到指定类名的SuperView对象
 *
 *  @param clazz SuperView类名
 *
 *  @return view对象
 */
- (id)bm_findSuperViewWithSuperViewClass:(Class)clazz {
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview bm_findSuperViewWithSuperViewClass:clazz];
    }
}
/**
 *  @brief  找到当前view所在的viewcontroler
 */
- (UIViewController *)bm_viewController {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}


#pragma mark ——— shake
- (void)bm_shake {
    [self _bm_shake:10 direction:1 currentTimes:0 withDelta:5 speed:0.03 shakeDirection:BMShakeDirectionHorizontal completion:nil];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:BMShakeDirectionHorizontal completion:nil];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)(void))handler {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:BMShakeDirectionHorizontal completion:handler];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:BMShakeDirectionHorizontal completion:nil];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)(void))handler {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:BMShakeDirectionHorizontal completion:handler];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BMShakeDirection)shakeDirection {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BMShakeDirection)shakeDirection completion:(void (^)(void))completion {
    [self _bm_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_bm_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BMShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    [UIView animateWithDuration:interval animations:^{
        self.layer.affineTransform = (shakeDirection == BMShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _bm_shake:(times - 1)
              direction:direction * -1
           currentTimes:current + 1
              withDelta:delta
                  speed:interval
         shakeDirection:shakeDirection
             completion:completionHandler];
    }];
}
@end
