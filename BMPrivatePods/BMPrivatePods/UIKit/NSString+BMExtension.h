//
//  NSString+BMExtension.h
//  Pods
//
//  Created by BirdMichael on 2018/10/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BMExtension)

- (CGSize)bm_sizeWithFont:(UIFont *)font;
/**
 *  @brief  通过label计算文字尺寸
 *
 *  @param size 主要用于定宽或者定高，或者定宽定高实际尺寸
 */
- (CGSize)bm_sizeWithMaxsize:(CGSize)size font:(UIFont *)font;
/**
 *  @brief  通过label计算文字尺寸
 *
 *  @param size 主要用于定宽或者定高，或者定宽定高实际尺寸
 *  @param limitedLine 设置label numberOfLines已计算尺寸
 */
- (CGSize)bm_sizeWithMaxsize:(CGSize)size font:(UIFont *)font limitedLine:(NSUInteger)limitedLine;
@end

NS_ASSUME_NONNULL_END
