//
//  BMStringUtil.h
//  BMPrivatePods
//
//  Created by BirdMichael on 2019/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMStringUtil : NSObject

/** 检查是否电话号码 */
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;
/** 检查是否是符合密码（任意-任意位数字和字母组合， 最少4位） */
+ (BOOL)checkPassword:(NSString *)password minCount:(NSUInteger)min maxCount:(NSUInteger)max;
/** 检查是否位用户名（中文英文数字） */
+ (BOOL)checkUserName:(NSString *)userName count:(NSUInteger)count;
/** 检查是否身份证 */
+ (BOOL)checkUserIdCard:(NSString *)idCard;
/** 检查是否网址 */
+ (BOOL)checkURL:(NSString *)url;
/**
 传入时间戳，返回今天、昨天、星期几、日期。。。。
 注：时间戳需要10位及以上，包括10位，否则返回“未知时间”
 */
+ (NSString *)achieveDayFormatByTimeString:(NSString *)timeString;


@end

NS_ASSUME_NONNULL_END
