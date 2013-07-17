//
//  NSDictionary+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (id)valueForKey:(NSString *)key defVal:(id)defVal
{
    id val = [self valueForKey:key];
    return nil==val ? defVal : val;
}

- (id)valueForKeys:(NSArray *)keys
{
  return [self valueForKeys:keys devVal:nil];
}

- (id)valueForKeys:(NSArray *)keys devVal:(id)defVal
{
  id val;
  for (NSString *key in keys) {
    if (nil!=(val = [self valueForKey:key])) {
      return val;
    }
  }
  return defVal;
}

@end
