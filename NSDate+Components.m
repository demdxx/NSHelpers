//
//  NSDate+Components.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSDate+Components.h"

@implementation NSDate (Components)

- (NSDateComponents *)components:(NSUInteger)flags calendar:(NSCalendar *)calendar
{
    return [calendar components:flags fromDate:self];
}

- (NSDateComponents *)components:(NSUInteger)flags
{
    return [self components:flags calendar:[NSCalendar currentCalendar]];
}

#pragma mark date companent

- (NSInteger)year:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSYearCalendarUnit fromDate:self];
    return [c year];
}

- (NSInteger)year
{
    return [self year:[NSCalendar currentCalendar]];
}

- (NSInteger)month:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSMonthCalendarUnit fromDate:self];
    return [c month];
}

- (NSInteger)month
{
    return [self month:[NSCalendar currentCalendar]];
}

- (NSInteger)day:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSDayCalendarUnit fromDate:self];
    return [c day];
}

- (NSInteger)day
{
    return [self day:[NSCalendar currentCalendar]];
}

- (NSInteger)hour:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSHourCalendarUnit fromDate:self];
    return [c hour];
}

- (NSInteger)hour
{
    return [self hour:[NSCalendar currentCalendar]];
}

- (NSInteger)minute:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSMinuteCalendarUnit fromDate:self];
    return [c minute];
}

- (NSInteger)minute
{
    return [self minute:[NSCalendar currentCalendar]];
}

- (NSInteger)second:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar components:NSSecondCalendarUnit fromDate:self];
    return [c second];
}

- (NSInteger)second
{
    return [self second:[NSCalendar currentCalendar]];
}

#pragma mark between

- (NSInteger)yearsBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSYearCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c year];
}

- (NSInteger)yearsBetween:(NSDate *)date
{
    return [self yearsBetween:date calendar:[NSCalendar currentCalendar]];
}

- (NSInteger)monthsBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSMonthCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c month];
}

- (NSInteger)monthsBetween:(NSDate *)date
{
    return [self monthsBetween:date calendar:[NSCalendar currentCalendar]];
}

- (NSInteger)daysBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSDayCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c day];
}

- (NSInteger)daysBetween:(NSDate *)date
{
    return [self daysBetween:date calendar:[NSCalendar currentCalendar]];
}

- (NSInteger)hoursBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSHourCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c hour];
}

- (NSInteger)hoursBetween:(NSDate *)date
{
    return [self hoursBetween:date calendar:[NSCalendar currentCalendar]];
}

- (NSInteger)minutesBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSMinuteCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c minute];
}

- (NSInteger)minutesBetween:(NSDate *)date
{
    return [self minutesBetween:date calendar:[NSCalendar currentCalendar]];
}

- (NSInteger)secondsBetween:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSDateComponents *c = [calendar
                components:NSSecondCalendarUnit
                  fromDate:self
                    toDate:date
                   options:0];
    
    return [c second];
}

- (NSInteger)secondsBetween:(NSDate *)date
{
    return [self secondsBetween:date calendar:[NSCalendar currentCalendar]];
}

@end
