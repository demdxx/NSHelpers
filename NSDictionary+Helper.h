//
//  NSDictionary+Helper.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

- (id)valueForKey:(NSString *)key defVal:(id)defVal;
- (id)valueForKeyPath:(NSString *)path defVal:(id)defVal;
- (id)valueForKeys:(NSArray *)keys;
- (id)valueForKeys:(NSArray *)keys devVal:(id)defVal;

@end
