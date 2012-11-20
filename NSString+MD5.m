//
// NSString+MD5.m
// Originally created for MyFile
//
// Created by Árpád Goretity, 2011. Some infos were grabbed from StackOverflow.
// Released into the public domain. You can do whatever you want with this within the limits of applicable law (so nothing nasty!).
// I'm not responsible for any damage related to the use of this software. There's NO WARRANTY AT ALL.
//

#import "NSString+MD5.h"

#ifndef __has_feature
#   define __has_feature(x) 0
#endif

@implementation NSString (MD5)

+ (NSString *)stringWithMD5OfFile:(NSString *)path
{
	NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath: path];
	if (handle == nil) {
		return nil;
	}

	CC_MD5_CTX md5;
	CC_MD5_Init (&md5);

	BOOL done = NO;

	while (!done) {

#if __has_feature(objc_arc)
        @autoreleasepool {
            NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
            CC_MD5_Update (&md5, [fileData bytes], [fileData length]);

            if ([fileData length] == 0) {
                done = YES;
            }
        }
#else
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
		CC_MD5_Update (&md5, [fileData bytes], [fileData length]);

		if ([fileData length] == 0) {
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

- (NSString *)md5 {

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

@end