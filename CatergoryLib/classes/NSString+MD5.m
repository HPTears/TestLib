//
//  NSString+MD5.m
//  ExampleApp-iOS
//
//  Created by tears on 16/8/5.
//  Copyright © 2016年 Marcus Westin. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

- (NSString *)MD5 {

    const char *inputStr = [self UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(inputStr, (CC_LONG)strlen(inputStr), md5Buffer);
    NSMutableString *outputStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [outputStr appendFormat:@"%02x", md5Buffer[i]];
    }
    return outputStr;
}

@end
