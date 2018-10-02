//
//  NSString+BMExtension.m
//  Pods
//
//  Created by BirdMichael on 2018/10/2.
//

#import "NSString+BMExtension.h"
#import "UILabel+BMExtension.h"


/** 节约性能，内建一个label计算（新建方法需要清空或者覆盖所有label属性） */

static UILabel *bmSizeLabel = nil;
@implementation NSString (BMExtension)

+ (void)load {
    bmSizeLabel = [UILabel new];
}

- (CGSize)bm_sizeWithFont:(UIFont *)font {
    @autoreleasepool {
        bmSizeLabel.text = self;
        bmSizeLabel.font = font;
        bmSizeLabel.numberOfLines = INT_MAX;
        return [bmSizeLabel bm_size];
    }
}

- (CGSize)bm_sizeWithMaxsize:(CGSize)size font:(UIFont *)font {
    @autoreleasepool {
        bmSizeLabel.text = self;
        bmSizeLabel.font = font;
        bmSizeLabel.numberOfLines = INT_MAX;
        return [bmSizeLabel bm_sizeWithMaxsize:size];
    }
}

- (CGSize)bm_sizeWithMaxsize:(CGSize)size font:(UIFont *)font limitedLine:(NSUInteger)limitedLine {
    @autoreleasepool {
        bmSizeLabel.text = self;
        bmSizeLabel.font = font;
        bmSizeLabel.numberOfLines = limitedLine;
        return [bmSizeLabel bm_sizeWithMaxsize:size];
    }
}
@end
