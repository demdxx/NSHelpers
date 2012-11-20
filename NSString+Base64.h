//
//  NSString+Base64.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//
//  Extension convert a string into base64
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;
+ (NSString *)base64StringFromString:(NSString*)str;

- (NSString *)base64String;

@end
