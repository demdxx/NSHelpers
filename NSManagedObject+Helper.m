//
//  NSManagedObject+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSManagedObject+Helper.h"

@implementation NSManagedObject (Helper)

- (NSDictionary *)dictionary
{
    NSArray *keys = [[[self entity] attributesByName] allKeys];
    return [self dictionaryWithValuesForKeys:keys];
}

@end
