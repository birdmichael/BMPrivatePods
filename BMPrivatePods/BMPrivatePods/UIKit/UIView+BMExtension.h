//
//  UIView+BMExtension.h
//  Pods
//
//  Created by BirdMichael on 2018/10/3.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BMShakeDirection) {
    BMShakeDirectionHorizontal = 0,
    BMShakeDirectionVertical
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BMExtension)

- (id)bm_findSubViewWithSubViewClass:(Class)clazz;
- (id)bm_findSuperViewWithSuperViewClass:(Class)clazz;
@property (readonly) UIViewController *bm_viewController;

#pragma mark ——— shake
- (void)bm_shake;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta completion:(void((^)(void)))handler;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void((^)(void)))handler;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BMShakeDirection)shakeDirection;
- (void)bm_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BMShakeDirection)shakeDirection completion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
