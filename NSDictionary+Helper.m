//
//  NSDictionary+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSDictionary+Helper.h"

#ifndef __has_feature
#   define __has_feature(x) 0
#endif

@implementation NSDictionary (Helper)

+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2
{
  NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
  
  if (nil != dict2) {
    [dict2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      id obj2 = [dict1 objectForKey:key];
      if (nil != obj2) {
        if ([obj isKindOfClass:NSDictionary.class] && [obj2 isKindOfClass:NSDictionary.class]) {
          NSDictionary *newVal = [obj2 dictionaryByMergingWith:(NSDictionary *)obj];
          [result setObject:newVal forKey:key];
        } else {
          [result setObject:obj forKey:key];
        }
      } else {
        [result setObject:obj forKey:key];
      }
    }];
  }
  
#if __has_feature(objc_arc)
  return [result autorelease];
#else
  return result;
#endif
}

- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict
{
  return [[self class] dictionaryByMerging:self with:dict];
}

- (id)valueForKey:(NSString *)key defVal:(id)defVal
{
  id val = [self valueForKey:key];
  return nil == val || [NSNull null] == val ? defVal : val;
}

- (id)valueForKeys:(NSArray *)keys
{
  return [self valueForKeys:keys devVal:nil];
}

- (id)valueForKeys:(NSArray *)keys devVal:(id)defVal
{
  id val;
  for (NSString *key in keys) {
    if (nil != (val = [self valueForKey:key]) && [NSNull null] != val) {
      return val;
    }
  }
  return defVal;
}

@end
