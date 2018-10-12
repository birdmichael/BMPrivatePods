//
//  UIButton+BMExtension.h
//  Pods
//
//  Created by BirdMichael on 2018/10/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^BMTouchedBlock)(void);

typedef NS_ENUM(NSUInteger, BMImageTextAlignment) {
    BMImageTextAlignmentImageLeftTextRight,
    BMImageTextAlignmentImageRightTextLeft,
    BMImageTextAlignmentImageTopTextBottom,
    BMImageTextAlignmentImageBottomTextTop
};

@interface UIButton (BMExtension)

/** 设置按钮额外点击区域 */
@property (nonatomic, assign) UIEdgeInsets bm_touchAreaInsets;

/**
 添加 addtarget
 */
- (void)bm_addActionHandler:(BMTouchedBlock)touchHandler;

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)bm_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 *  @brief  设置按钮图片与文字排列方式 以及两者相对间距
 *
 *  @param alignment 对其方式
 *
 */

- (void)bm_setImageTextAlignment:(BMImageTextAlignment)alignment padding:(CGFloat)padding;

// 根据按钮内容与边距，计算按钮应该的大小（文字或图片）
// 优先判断 normal title，如果不存在，则判断 normal image
// 仅做大小计算，不进行重新布局

/**
 *  @brief  根据按钮内容与边距，计算按钮应该的大小（文字或图片）
 *
 *  优先判断 normal title，如果不存在，则判断 normal image （仅做大小计算，不进行重新布局）
 *
 *
 *  @param insets 按钮间距
 *
 *  @return 计算后的按钮大小
 */
- (CGSize)bm_sizeWithContentInsets:(UIEdgeInsets)insets;

/**
 *  @brief  根据按钮内容与边距，计算按钮应该的大小（文字或图片）
 *
 *  优先判断 normal title，如果不存在，则判断 normal image （仅做大小计算，不进行重新布局）
 *
 *  @param insets 按钮间距
 *  @param alignment 文字图片对其方式
 *  @param padding 图片文字间隔距离
 *
 *  @return 计算后的按钮大小
 */
- (CGSize)st_sizeWithContentInsets:(UIEdgeInsets)insets alignment:(BMImageTextAlignment)alignment padding:(CGFloat)padding;

@end

NS_ASSUME_NONNULL_END


#pragma mark ——— BMRoundedButton

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BMRoundedButton : UIButton

@property (nonatomic, assign) IBInspectable UIRectCorner corners;
@property (nonatomic, assign) IBInspectable CGFloat bm_cornerRaduous;

@end
