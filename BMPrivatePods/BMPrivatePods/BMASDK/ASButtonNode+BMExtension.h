//
//  ASButtonNode+BMExtension.h
//  Calm
//
//  Created by BirdMichael on 2018/10/23.
//  Copyright © 2018 BirdMichael. All rights reserved.
//
#if __has_include(<AsyncDisplayKit/ASButtonNode.h>)
#import "ASButtonNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface ASButtonNode (BMExtension)
/** 设置按钮额外点击区域 */
@property (nonatomic, assign) UIEdgeInsets bm_touchAreaInsets;
@end

NS_ASSUME_NONNULL_END
#endif
