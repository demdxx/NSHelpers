//
//  NSDictionary+Hashes.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSString (Hashes)

// MD5 hash of the file on the filesystem specified by path
+ (NSString *)stringWithMD5OfFile:(NSString *)path;

- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)sha512;

@end