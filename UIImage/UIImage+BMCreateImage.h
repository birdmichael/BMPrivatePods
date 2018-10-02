//
//  UIImage+BMCreateImage.h
//  Pods
//
//  Created by BirdMichael on 2018/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BMCreateImage)

/**
*  图片左右拉伸
*  fLeftCapWidth:  第一次拉伸的left点
*  fTopCapHeight:  第一次拉伸的top点
*  tempWidth:      图片最后要展示的宽度
*  sLeftCapWidth:  第二次拉伸的left点
*  sTopCapHeight:  第二次拉伸的top点
*/
- (UIImage *)bm_stretchLeftAndRightWithiLeftCapWidth:(CGFloat)fLeftCapWidth
                                       fTopCapHeight:(CGFloat)fTopCapHeight
                                           tempWidth:(CGFloat)tempWidth
                                       sLeftCapWidth:(CGFloat)sLeftCapWidth
                                       sTopCapHeight:(CGFloat)sTopCapHeight;

@end

NS_ASSUME_NONNULL_END
