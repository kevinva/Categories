//
//  NSString+CleanSpecailChar.m
//  Biando
//
//  Created by biando on 12-12-27.
//  Copyright (c) 2012年 biando. All rights reserved.
//

#import "NSString+CleanSpecailChar.h"

@implementation NSString (CleanSpecailChar)

- (NSString *)cleanWhiteSpace{
    NSString *result = [NSString stringWithString:self];
    
    while([result hasPrefix:@" "]){
        result = [result substringFromIndex:1];
    }
    
    while([result hasSuffix:@" "]){
        result = [result substringToIndex:result.length - 1];
    }
    
    return result;
}

- (NSString *)trimBothEndWhiteSpace{
    NSString *string = [NSString stringWithString:self];
    while([string hasPrefix:@"\n"]){
        string = [string substringFromIndex:1];
    }
    while([string hasSuffix:@"\n"]){
        string = [string substringToIndex:[string length] - 1];
    }
    
    while([string hasPrefix:@"\r"]){
        string = [string substringFromIndex:1];
    }
    while([string hasSuffix:@"\r"]){
        string = [string substringToIndex:[string length] - 1];
    }
    
    while([string hasPrefix:@" "]){
        string = [string substringFromIndex:1];
    }
    while([string hasSuffix:@" "]){
        string = [string substringToIndex:[string length] - 1];
    }
    
    return string;
}

- (NSString *)formatWebChar{
    NSString *result = [NSString stringWithString:self];
    result = [result stringByReplacingOccurrencesOfString:@"\b" withString:@"\\b"];
    result = [result stringByReplacingOccurrencesOfString:@"\f" withString:@"\\f"];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    result = [result stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    result = [result stringByReplacingOccurrencesOfString:@"\t" withString:@"\\t"];
    result = [result stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    return result;
}

//慎用
- (NSString *)cleanWebCharWithWhiteSpace{
    NSString *result = [NSString stringWithString:self];
    result = [result stringByReplacingOccurrencesOfString:@"\b" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\f" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    return result;
}

- (NSString *)filenameFromUrl{
    NSArray *components = [self componentsSeparatedByString:@"://"];
    if(components.count == 2){
        NSString *temp = [components objectAtIndex:1];
        return [temp stringByReplacingOccurrencesOfString:@"/" withString:@"#"];
    }
    
    return nil;
}

- (NSString *)urlFromFilename{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"#" withString:@"/"];
    return [NSString stringWithFormat:@"http://%@", result];
}

@end
