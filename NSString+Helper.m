//
//  NSString+Helper.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSString+Helper.h"

#ifndef __has_feature
#   define __has_feature(x) 0
#endif

@implementation NSString (Helper)

- (BOOL)containsString:(NSString *)search
{
    return [self rangeOfString:search].location != NSNotFound;
}

#pragma mark URL encode / decode

- (NSString *)stringByUrlEncoding
{
#if __has_feature(objc_arc)
	return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)self,  NULL,  (CFStringRef)@"!*'();:@&=+$,/?%#[]",  kCFStringEncodingUTF8);
#else
	return [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)self,  NULL,  (CFStringRef)@"!*'();:@&=+$,/?%#[]",  kCFStringEncodingUTF8) autorelease];
#endif
}

- (NSString *)stringByUrlDecoding
{
	return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark Mathes

#if NS_BLOCKS_AVAILABLE
- (void)matches:(NSString *)expression options:(NSMatchingOptions)options usingBlock:(void (^)(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop))block
{
    NSRegularExpression *regex = [NSRegularExpression         
        regularExpressionWithPattern:expression
        options:options
        error:nil];

    [regex enumerateMatchesInString:self options:0 range:NSMakeRange(0, [self length]) usingBlock:block];
}

- (void)matches:(NSString *)expression usingBlock:(void (^)(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop))block
{
    [self matches:expression options:NSRegularExpressionCaseInsensitive usingBlock:block];
}
#endif

/**
 * Split string from regular expression
 * @param expression
 * @param outarr array of split strings
 */
- (NSArray *)splitByRegex:(NSString *)expression splits:(NSMutableArray *)outarr
{
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:expression
        options:NSRegularExpressionCaseInsensitive
        error:nil];

    NSMutableArray *result = [NSMutableArray array];
    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];

    if (nil!=matches && [matches count]>0)
    {
        NSInteger position = 0;
        NSRange range, matchRange;
        
        // Add sections
        for (NSTextCheckingResult *match in matches)
        {
            matchRange = [match range];
            range.location = position;
            range.length = matchRange.location - position;

            if (matchRange.length<1)
            {
                [result addObject:@""];
            }
            else
            {
                [result addObject:[self substringWithRange:range]];
            }

            if (nil!=outarr)
            {
                [outarr addObject:[self substringWithRange:matchRange]];
            }

            position = matchRange.location + matchRange.length;
        }
        
        // Add tail
        if (position<[self length])
        {
            range.location = position;
            range.length = [self length]-position;
            [result addObject:[self substringWithRange:range]];
        }
    }
    else
    {
        [result addObject:self];
    }
    return result;
}

- (NSArray *)splitByRegex:(NSString *)expression
{
    return [self splitByRegex:expression splits:nil];
}

#pragma mark other

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
