//
//  NSDictionary+Helper.h
//
//  @copyright 2012 Dmitry Ponomarev <demdxx@gmail.com>
//  @license CC BY 3.0
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

- (id)valueForKey:(NSString *)key defval:(id)defval;

@end
