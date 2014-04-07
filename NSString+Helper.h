//
//  NSString+Helper.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (BOOL)containsString:(NSString *)search;

- (NSString *)stringByUrlEncoding;
- (NSString *)stringByUrlDecoding;

#if NS_BLOCKS_AVAILABLE
- (void)matches:(NSString *)expression options:(NSMatchingOptions)options usingBlock:(void (^)(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop))block;

- (void)matches:(NSString *)expression usingBlock:(void (^)(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop))block;
#endif

- (NSArray *)splitByRegex:(NSString *)expression splits:(NSMutableArray *)outarr;
- (NSArray *)splitByRegex:(NSString *)expression;

- (NSString *)trim;

- (NSString *)replaceByDict:(NSDictionary *)params;

@end
