//
//  NSDate+Components.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

- (NSDateComponents *)components:(NSUInteger)flags calendar:(NSCalendar *)calendar;
- (NSDateComponents *)components:(NSUInteger)flags;

- (NSInteger)year:(NSCalendar *)calendar;
- (NSInteger)year;
- (NSInteger)month:(NSCalendar *)calendar;
- (NSInteger)month;
- (NSInteger)day:(NSCalendar *)calendar;
- (NSInteger)day;
- (NSInteger)hour:(NSCalendar *)calendar;
- (NSInteger)hour;
- (NSInteger)minute:(NSCalendar *)calendar;
- (NSInteger)minute;
- (NSInteger)second:(NSCalendar *)calendar;
- (NSInteger)second;

- (NSInteger)yearsBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)yearsBetween:(NSDate *)date;
- (NSInteger)monthsBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)monthsBetween:(NSDate *)date;
- (NSInteger)daysBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)daysBetween:(NSDate *)date;
- (NSInteger)hoursBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)hoursBetween:(NSDate *)date;
- (NSInteger)minutesBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)minutesBetween:(NSDate *)date;
- (NSInteger)secondsBetween:(NSDate *)date calendar:(NSCalendar *)calendar;
- (NSInteger)secondsBetween:(NSDate *)date;

@end
