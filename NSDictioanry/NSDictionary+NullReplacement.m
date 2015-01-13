//
//  NSDictionary+NullReplacement.m
//  21DigitalPaperiPad
//
//  Created by 何峙 on 14-6-2.
//  Copyright (c) 2014年 Kevin. All rights reserved.
//

#import "NSDictionary+NullReplacement.h"

@implementation NSDictionary (NullReplacement)

- (NSDictionary *)dictionaryByReplaceNullWithBlankString{
    const id nullObj = [NSNull null];
    const NSString *blankString = @"";
    NSMutableDictionary *mutableSelf = [self mutableCopy];
    [mutableSelf enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if(obj == nullObj){
            [mutableSelf setObject:blankString forKey:key];
        }
        
    }];
    
    return [mutableSelf copy];
}

@end
