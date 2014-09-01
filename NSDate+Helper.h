//
//  NSDate+Helper.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string timeZone:(id)timeZone;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format timeZone:(id)timeZone;


+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string timeZone:(id)timeZone;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date timeZone:(id)timeZone;


- (NSString *)string;
- (NSString *)stringWithTimeZone:(id)timeZone;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format timeZone:(id)timeZone;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle timeZone:(id)timeZone;


+ (NSDate *)offset:(NSDate *)date days:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;
+ (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;
- (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;


+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;

@end
