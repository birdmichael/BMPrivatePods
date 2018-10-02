//
//  UIScreen+BMExtension.m
//  BMPrivatePods
//
//  Created by BirdMichael on 2018/9/16.
//

#import "UIScreen+BMFrame.h"

@implementation UIScreen (BMExtension)

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


+ (CGSize)bm_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}



@end
