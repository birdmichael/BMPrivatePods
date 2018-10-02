//
//  UIImage+BMCreateImage.m
//  Pods
//
//  Created by BirdMichael on 2018/9/26.
//

#import "UIImage+BMCreateImage.h"

@implementation UIImage (BMCreateImage)
- (UIImage *)bm_stretchLeftAndRightWithiLeftCapWidth:(CGFloat)fLeftCapWidth
                                       fTopCapHeight:(CGFloat)fTopCapHeight
                                           tempWidth:(CGFloat)tempWidth
                                       sLeftCapWidth:(CGFloat)sLeftCapWidth
                                       sTopCapHeight:(CGFloat)sTopCapHeight {
    
    UIImage *image1 = [self stretchableImageWithLeftCapWidth:fLeftCapWidth topCapHeight:fTopCapHeight];
    
    CGSize imageSize = self.size;
    CGFloat tw = floor(tempWidth /2.0) + floor(imageSize.width /2.0);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tw, imageSize.height),NO, [UIScreen mainScreen].scale);
    [image1 drawInRect:CGRectMake(0,0, tw, imageSize.height)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image2 stretchableImageWithLeftCapWidth:sLeftCapWidth topCapHeight:sTopCapHeight];
    
}
@end
