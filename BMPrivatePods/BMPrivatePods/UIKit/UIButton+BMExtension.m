//
//  UIButton+BMExtension.m
//  Pods
//
//  Created by BirdMichael on 2018/10/2.
//

#import "UIButton+BMExtension.h"
#import <objc/runtime.h>
#import "NSString+BMExtension.h"

@implementation UIButton (BMExtension)

static const void *UIButtonBlockKey = &UIButtonBlockKey;
- (void)bm_addActionHandler:(BMTouchedBlock)touchHandler {
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionTouched:(UIButton *)btn{
    BMTouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block();
    }
}

- (void)bm_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)bm_setImageTextAlignment:(BMImageTextAlignment)alignment padding:(CGFloat)padding {
    self.imageEdgeInsets = UIEdgeInsetsZero;
    self.titleEdgeInsets = UIEdgeInsetsZero;
    self.contentEdgeInsets = UIEdgeInsetsZero;
    
    UIImageView *imageView = self.imageView;
    UILabel *textLabel = self.titleLabel;
    
    CGFloat selfWidth = CGRectGetWidth(self.bounds);
    CGFloat selfHeight = CGRectGetHeight(self.bounds);
    CGFloat textX = CGRectGetMinX(textLabel.frame);
    CGFloat textY = CGRectGetMinY(textLabel.frame);
    CGFloat imageX = CGRectGetMinX(imageView.frame);
    CGFloat imageY = CGRectGetMinY(imageView.frame);
    CGFloat textWidth = CGRectGetWidth(textLabel.bounds);
    CGFloat textHeight = CGRectGetHeight(textLabel.bounds);
    CGFloat imageWidth = CGRectGetWidth(imageView.bounds);
    CGFloat imageHeight = CGRectGetHeight(imageView.bounds);
    CGFloat totalHeight = textHeight + padding + imageHeight;
    
    UIEdgeInsets imageEdge = UIEdgeInsetsZero;
    UIEdgeInsets textEdge = UIEdgeInsetsZero;
    
    switch (alignment) {
        case BMImageTextAlignmentImageLeftTextRight:
            textEdge = UIEdgeInsetsMake(0, padding / 2, 0, -padding / 2);
            imageEdge = UIEdgeInsetsMake(0, -padding / 2, 0, padding / 2);
            break;
        case BMImageTextAlignmentImageRightTextLeft:
            textEdge = UIEdgeInsetsMake(0, -(imageWidth + padding / 2), 0, (imageWidth + padding / 2));
            imageEdge = UIEdgeInsetsMake(0, (textWidth + padding / 2), 0, -(textWidth + padding / 2));
            break;
        case BMImageTextAlignmentImageTopTextBottom:
            textEdge = UIEdgeInsetsMake(((selfHeight - totalHeight) / 2 + imageHeight + padding - textY),
                                        (selfWidth / 2 - textX - textWidth / 2) - (selfWidth - textWidth) / 2,
                                        -((selfHeight - totalHeight) / 2 + imageHeight + padding - textY),
                                        -(selfWidth/2 - textX - textWidth / 2) - (selfWidth - textWidth) / 2);
            imageEdge = UIEdgeInsetsMake(((selfHeight - totalHeight) / 2 - imageY),
                                         (selfWidth / 2 - imageX - imageWidth / 2),
                                         -((selfHeight - totalHeight) / 2 - imageY),
                                         -(selfWidth / 2 - imageX - imageWidth / 2));
            break;
        case BMImageTextAlignmentImageBottomTextTop:
            textEdge = UIEdgeInsetsMake(((selfHeight - totalHeight) / 2 - textY),
                                        (selfWidth / 2 - textX - textWidth / 2) - (selfWidth - textWidth) / 2,
                                        -((selfHeight - totalHeight) / 2 - textY),
                                        -(selfWidth / 2 - textX - textWidth / 2) - (selfWidth - textWidth) / 2);
            imageEdge = UIEdgeInsetsMake(((selfHeight - totalHeight) / 2 + textHeight + padding - imageY),
                                         (selfWidth / 2 - imageX - imageWidth / 2),
                                         -((selfHeight - totalHeight) / 2 + textHeight + padding - imageY),
                                         -(selfWidth / 2 - imageX - imageWidth / 2));
            break;
        default:
            break;
    }
    if (UIEdgeInsetsEqualToEdgeInsets(textEdge, UIEdgeInsetsZero) || UIEdgeInsetsEqualToEdgeInsets(imageEdge, UIEdgeInsetsZero)) {
        return;
    }
    self.imageEdgeInsets = imageEdge;
    self.titleEdgeInsets = textEdge;
}
- (CGSize)bm_sizeWithContentInsets:(UIEdgeInsets)insets {
    NSString *title = [self titleForState:UIControlStateNormal];
    // 计算 title
    if (title != nil && title.length != 0) {
        UIFont *titleFont = self.titleLabel.font;
        CGSize titleSize = [title bm_sizeWithFont:titleFont];
        return CGSizeMake(titleSize.width + insets.left + insets.right, titleSize.height + insets.top + insets.bottom);
    }
    UIImage *image = [self imageForState:UIControlStateNormal];
    if (image != nil) {
        CGSize imageSize = image.size;
        return CGSizeMake(imageSize.width + insets.left + insets.right, imageSize.height + insets.top + insets.bottom);
    }
    return CGSizeMake(insets.left + insets.right, insets.top + insets.bottom);
}
- (CGSize)st_sizeWithContentInsets:(UIEdgeInsets)insets alignment:(BMImageTextAlignment)alignment padding:(CGFloat)padding {
    NSString *title = [self titleForState:UIControlStateNormal];
    UIImage *image = [self imageForState:UIControlStateNormal];
    
    if (title == nil || title.length == 0 || image == nil) {
        return CGSizeMake(insets.left + insets.right, insets.top + insets.bottom);
    }
    UIFont *titleFont = self.titleLabel.font;
    CGSize titleSize = [title bm_sizeWithFont:titleFont];
    CGSize imageSize = image.size;
    
    CGFloat sumHeight = 0;
    CGFloat sumWidth = 0;
    
    switch (alignment) {
        case BMImageTextAlignmentImageLeftTextRight:
        case BMImageTextAlignmentImageRightTextLeft:
            sumWidth = titleSize.width + imageSize.width + padding;
            sumHeight = MAX(titleSize.height, imageSize.height);
            break;
        case BMImageTextAlignmentImageTopTextBottom:
        case BMImageTextAlignmentImageBottomTextTop:
            sumWidth = MAX(titleSize.width, imageSize.width);
            sumHeight = titleSize.height + imageSize.height + padding;
            break;
    }
    
    return CGSizeMake(ceil(insets.left + insets.right + sumWidth), ceil(insets.top + insets.bottom + sumHeight));
}

@end


#pragma mark ——— BMRoundedButton
@implementation BMRoundedButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupShapeLayer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupShapeLayer];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupShapeLayer];
}

- (void)makeCorner {
    _bm_cornerRaduous = _bm_cornerRaduous ?: 5.0;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:self.corners
                                                         cornerRadii:CGSizeMake(_bm_cornerRaduous, _bm_cornerRaduous)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

- (void)setupShapeLayer {
    [self makeCorner];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self makeCorner];
}

@end
