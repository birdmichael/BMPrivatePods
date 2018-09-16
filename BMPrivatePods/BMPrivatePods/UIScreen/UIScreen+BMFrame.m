//
//  UIScreen+BMFrame.m
//  BMPrivatePods
//
//  Created by BirdMichael on 2018/9/16.
//

#import "UIScreen+BMFrame.h"

@implementation UIScreen (BMFrame)

+ (CGSize)bm_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)bm_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)bm_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)bm_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? SizeSWAP([UIScreen bm_size]) : [UIScreen bm_size];
}

+ (CGFloat)bm_orientationWidth
{
    return [UIScreen bm_orientationSize].width;
}

+ (CGFloat)bm_orientationHeight
{
    return [UIScreen bm_orientationSize].height;
}

+ (CGSize)bm_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
