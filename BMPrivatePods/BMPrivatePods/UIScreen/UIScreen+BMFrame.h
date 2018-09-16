//
//  UIScreen+BMFrame.h
//  BMPrivatePods
//
//  Created by BirdMichael on 2018/9/16.
//

#import <UIKit/UIKit.h>

@interface UIScreen (BMFrame)

+ (CGSize)bm_size;
+ (CGFloat)bm_width;
+ (CGFloat)bm_height;

+ (CGSize)bm_orientationSize;
+ (CGFloat)bm_orientationWidth;
+ (CGFloat)bm_orientationHeight;
+ (CGSize)bm_DPISize;

@end
