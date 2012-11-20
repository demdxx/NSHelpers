//
//  NSDate+Helper.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;


- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;


+ (NSDate *)offset:(NSDate *)date days:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;
+ (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;
- (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years;


+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;

@end
