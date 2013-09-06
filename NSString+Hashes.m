//
//  NSDictionary+Hashes.m
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import "NSString+Hashes.h"
#import <CommonCrypto/CommonDigest.h>

#ifndef __has_feature
#   define __has_feature(x) 0
#endif

@implementation NSString (Hashes)

////////////////////////////////////////////////////////////////////////////////
#pragma mark MD5
////////////////////////////////////////////////////////////////////////////////

+ (NSString *)stringWithMD5OfFile:(NSString *)path
{
	NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath: path];
	if (handle == nil)
	{
		return nil;
	}
  
	CC_MD5_CTX md5;
	CC_MD5_Init (&md5);
  
	BOOL done = NO;
  
	while (!done)
	{
#if __has_feature(objc_arc)
    @autoreleasepool
    {
      NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
      CC_MD5_Update (&md5, [fileData bytes], [fileData length]);
      
      if ([fileData length] == 0)
      {
        done = YES;
      }
    }
#else
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
		CC_MD5_Update (&md5, [fileData bytes], [fileData length]);
    
		if ([fileData length] == 0)
		{
			done = YES;
		}
    
		[fileData release];
		[pool release];
#endif
    
	}
  
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final (digest, &md5);
	NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                 digest[0],  digest[1],
                 digest[2],  digest[3],
                 digest[4],  digest[5],
                 digest[6],  digest[7],
                 digest[8],  digest[9],
                 digest[10], digest[11],
                 digest[12], digest[13],
                 digest[14], digest[15]];
  
	return s;
  
}

- (NSString *)md5
{
	CC_MD5_CTX md5;
	CC_MD5_Init (&md5);
	CC_MD5_Update (&md5, [self UTF8String], [self length]);
  
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final (digest, &md5);
	NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                 digest[0],  digest[1],
                 digest[2],  digest[3],
                 digest[4],  digest[5],
                 digest[6],  digest[7],
                 digest[8],  digest[9],
                 digest[10], digest[11],
                 digest[12], digest[13],
                 digest[14], digest[15]];
  
	return s;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark SHA1
////////////////////////////////////////////////////////////////////////////////

- (NSString *)sha1
{
  CC_SHA1_CTX sha1;
	CC_SHA1_Init (&sha1);
	CC_SHA1_Update (&sha1, [self UTF8String], [self length]);
  
	unsigned char digest[CC_SHA1_DIGEST_LENGTH];
	CC_SHA1_Final (digest, &sha1);
	NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                 digest[0],  digest[1],
                 digest[2],  digest[3],
                 digest[4],  digest[5],
                 digest[6],  digest[7],
                 digest[8],  digest[9],
                 digest[10], digest[11],
                 digest[12], digest[13],
                 digest[14], digest[15],
                 digest[16], digest[17],
                 digest[18], digest[19]];
  
	return s;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark SHA256
////////////////////////////////////////////////////////////////////////////////

- (NSString *)sha256
{
  CC_SHA256_CTX sha256;
	CC_SHA256_Init (&sha256);
	CC_SHA256_Update (&sha256, [self UTF8String], [self length]);
  
	unsigned char digest[CC_SHA256_DIGEST_LENGTH];
	CC_SHA256_Final (digest, &sha256);
  
  NSMutableString *s = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
  for (int i=0;i<CC_SHA256_DIGEST_LENGTH;i++) {
    [s appendFormat:@"%02x", digest[i]];
  }
  
	return s;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark SHA512
////////////////////////////////////////////////////////////////////////////////

- (NSString *)sha512
{
  CC_SHA512_CTX sha512;
	CC_SHA512_Init (&sha512);
	CC_SHA512_Update (&sha512, [self UTF8String], [self length]);
  
	unsigned char digest[CC_SHA512_DIGEST_LENGTH];
	CC_SHA512_Final (digest, &sha512);
  
  NSMutableString *s = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
  
  for (int i=0;i<CC_SHA512_DIGEST_LENGTH;i++) {
    [s appendFormat:@"%02x", digest[i]];
  }
  
	return s;
}

@end