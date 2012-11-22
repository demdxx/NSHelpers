//
//  NSDictionary+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (id)valueForKey:(NSString *)key defval:(id)defval
{
    id val = [self valueForKey:key];
    return nil==val ? defval : val;
}

@end
