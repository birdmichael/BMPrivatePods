//
//  BMStringUtil.m
//  BMPrivatePods
//
//  Created by BirdMichael on 2019/1/16.
//

#import "BMStringUtil.h"

@implementation BMStringUtil
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    return isMatch;
}


+ (BOOL)checkPassword:(NSString *)password minCount:(NSUInteger)min maxCount:(NSUInteger)max
{
    NSString *pattern = [NSString stringWithFormat:@"^(?=.*[a-zA-Z\\d])(?=.*[a-zA-Z\\W])(?=.*[\\d\\W]).{%lu,%lu}$",(unsigned long)min,(unsigned long)max];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

+ (BOOL)checkUserName:(NSString *)userName count:(NSUInteger)count;
{
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}

+ (BOOL)checkUserIdCard:(NSString *)idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

+ (BOOL)checkURL:(NSString *)url
{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
}

+ (NSString *)achieveDayFormatByTimeString:(NSString *)timeString {
    if (!timeString || timeString.length < 10) {
        return @"时间未知";
    }
    //将时间戳转为NSDate类
    NSTimeInterval time = [[timeString substringToIndex:10] doubleValue];
    NSDate *inputDate=[NSDate dateWithTimeIntervalSince1970:time];
    //
    NSString *lastTime = [self compareDate:inputDate];
    return lastTime;
}
+ (NSString *)compareDate:(NSDate *)inputDate{
    
    //修正8小时的差时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger goalInterval = [zone secondsFromGMTForDate: inputDate];
    NSDate *date = [inputDate  dateByAddingTimeInterval: goalInterval];
    
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSInteger localInterval = [zone secondsFromGMTForDate: currentDate];
    NSDate *localeDate = [currentDate  dateByAddingTimeInterval: localInterval];
    
    //今天／昨天／前天
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    NSDate *today = localeDate;
    NSDate *yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    NSDate *beforeOfYesterday = [yesterday dateByAddingTimeInterval: -secondsPerDay];
    
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *beforeOfYesterdayString = [[beforeOfYesterday description] substringToIndex:10];
    
    //今年
    NSString *toYears = [[today description] substringToIndex:4];
    
    //目标时间拆分为 年／月
    NSString *dateString = [[date description] substringToIndex:10];
    NSString *dateYears = [[date description] substringToIndex:4];
    
    NSString *dateContent;
    if ([dateYears isEqualToString:toYears]) {//同一年
        //今 昨 前天的时间
        NSString *time = [[date description] substringWithRange:(NSRange){11,5}];
        //其他时间
        NSString *time2 = [[date description] substringWithRange:(NSRange){5,11}];
        if ([dateString isEqualToString:todayString]){
            //今天
            NSCalendar *calendar = [NSCalendar currentCalendar];
            int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *cmp =  [calendar components:unit fromDate:date toDate:[NSDate date] options:0];
            if (cmp.hour >= 12) {
                return [NSString stringWithFormat:@"%@",time];
            } else if (cmp.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            } else if (cmp.minute > 1){
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            } else {
                return @"刚刚";
            }
        } else if ([dateString isEqualToString:yesterdayString]){
            //昨天
            dateContent = [NSString stringWithFormat:@"昨天"];
            return dateContent;
        }else if ([dateString isEqualToString:beforeOfYesterdayString]){
            //前天
            dateContent = [NSString stringWithFormat:@"前天"];
            return dateContent;
        }else{
            if ([self compareDateFromeWorkTimeToNow:time2]) {
                //一周之内，显示星期几
                return [[self class]weekdayStringFromDate:inputDate];
                
            }else{
                //一周之外，显示“月-日 时：分” ，如：05-23 06:22
                return time2;
            }
        }
    }else{
        //不同年，显示具体日期：如，2008-11-11
        return dateString;
    }
}
+ (BOOL)compareDateFromeWorkTimeToNow:(NSString *)timeStr
{
    //获得当前时间并转为字符串 2017-07-16 07:54:36 +0000(NSDate类)
    NSDate *currentDate = [NSDate date];
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//实例化时间格式类
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//格式化
    NSString *timeString = [df stringFromDate:currentDate];
    timeString = [timeString substringFromIndex:5];
    
    int today = [timeString substringWithRange:(NSRange){3,2}].intValue;
    int workTime = [timeStr substringWithRange:(NSRange){3,2}].intValue;
    if ([[timeStr substringToIndex:2] isEqualToString:[timeString substringToIndex:2]]) {
        if (today - workTime <= 6) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}
//返回星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

@end
