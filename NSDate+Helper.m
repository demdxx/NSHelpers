//
//  NSDate+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSDate+Helper.h"

#ifndef __has_feature
#   define __has_feature(x) 0
#endif

#if __has_feature(objc_arc)
#   define DT_OBJECT_RELEASE(obj)
#else
#   define DT_OBJECT_RELEASE(obj) if (obj!=nil) { \
                                    [obj release]; obj=nil; }
#endif


@implementation NSDate (Helper)

////////////////////////////////////////////////////////////////////////////////
#pragma mark – Date from string
////////////////////////////////////////////////////////////////////////////////

+ (NSDate *)dateFromString:(NSString *)string
{
	return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string timeZone:(id)timeZone
{
  return [NSDate dateFromString:string withFormat:[NSDate dbFormatString] timeZone:timeZone];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
	return [NSDate dateFromString:string withFormat:format timeZone:nil];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format timeZone:(id)timeZone
{
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
  if (nil != timeZone) {
    if ([timeZone isKindOfClass:[NSTimeZone class]]) {
      [inputFormatter setTimeZone:timeZone];
    } else {
      [inputFormatter setTimeZone:[NSTimeZone timeZoneWithName:(NSString *)timeZone]];
    }
  }
	DT_OBJECT_RELEASE(inputFormatter);
	return date;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark – String from date
////////////////////////////////////////////////////////////////////////////////

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
	return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format timeZone:(id)timeZone
{
	return [date stringWithFormat:format timeZone:timeZone];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
	return [date string];
}

+ (NSString *)stringFromDate:(NSDate *)date timeZone:(id)timeZone
{
  return [date stringWithTimeZone:timeZone];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark – format to string
////////////////////////////////////////////////////////////////////////////////

- (NSString *)string
{
	return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithTimeZone:(id)timeZone
{
	return [self stringWithFormat:[NSDate dbFormatString] timeZone:timeZone];
}

- (NSString *)stringWithFormat:(NSString *)format
{
	return [self stringWithFormat:format timeZone:nil];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(id)timeZone
{
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:format];
	NSString *timestamp_str = [outputFormatter stringFromDate:self];
  if (nil != timeZone) {
    if ([timeZone isKindOfClass:[NSTimeZone class]]) {
      [outputFormatter setTimeZone:timeZone];
    } else {
      [outputFormatter setTimeZone:[NSTimeZone timeZoneWithName:(NSString *)timeZone]];
    }
  }
	DT_OBJECT_RELEASE(outputFormatter);
	return timestamp_str;
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
	return [self stringWithDateStyle:dateStyle timeStyle:timeStyle timeZone:nil];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle timeZone:(id)timeZone
{
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateStyle:dateStyle];
	[outputFormatter setTimeStyle:timeStyle];
	NSString *outputString = [outputFormatter stringFromDate:self];
  if (nil != timeZone) {
    if ([timeZone isKindOfClass:[NSTimeZone class]]) {
      [outputFormatter setTimeZone:timeZone];
    } else {
      [outputFormatter setTimeZone:[NSTimeZone timeZoneWithName:(NSString *)timeZone]];
    }
  }
	DT_OBJECT_RELEASE(outputFormatter);
	return outputString;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark – Date offsets
////////////////////////////////////////////////////////////////////////////////

+ (NSDate *)offset:(NSDate *)date days:(NSInteger)days months:(NSInteger)months years:(NSInteger)years
{
    // Create and initialize date component instance
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    [dateComponents setMonth:months];
    [dateComponents setYear:years];

    // Retrieve date with increased days count
    NSDate *newDate = [[NSCalendar currentCalendar] 
                          dateByAddingComponents:dateComponents 
                                          toDate:date options:0];

    // Clean up
    DT_OBJECT_RELEASE(dateComponents);

    return newDate;
}

+ (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years {
    return [NSDate offset:[NSDate date] days:days months:months years:years];
}

- (NSDate *)offset:(NSInteger)days months:(NSInteger)months years:(NSInteger)years
{
    return [NSDate offset:self days:days months:months years:years];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark – date formats
////////////////////////////////////////////////////////////////////////////////

+ (NSString *)dateFormatString
{
	return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString
{
	return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString
{
	return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)dbFormatString
{
	return [NSDate timestampFormatString];
}

@end
