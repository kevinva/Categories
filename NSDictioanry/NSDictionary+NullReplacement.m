//
//  NSDictionary+NullReplacement.m
//  21DigitalPaperiPad
//
//  Created by 何峙 on 14-6-2.
//  Copyright (c) 2014年 Kevin. All rights reserved.
//

#import "NSDictionary+NullReplacement.h"

@implementation NSDictionary (NullReplacement)

- (NSDictionary *)hz_dictionaryByReplaceNullWithBlankString{
    const id nullObj = [NSNull null];
    const NSString *blankString = @"";
    NSMutableDictionary *mutableSelf = [self mutableCopy];
    [mutableSelf enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if(obj == nullObj){
            [mutableSelf setObject:blankString forKey:key];
        }
        else if ([obj isKindOfClass:[NSArray class]]) {
            NSArray *list = (NSArray *)obj;
            NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:list.count];
            for (id listItem in list) {
                if ([listItem isKindOfClass:[NSDictionary class]]) {
                    [mutableList addObject:[(NSDictionary *)listItem hz_dictionaryByReplaceNullWithBlankString]];
                }
            }
            [mutableSelf setObject:mutableList forKey:key];
        }
        else if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)obj;
            [mutableSelf setObject:[dict hz_dictionaryByReplaceNullWithBlankString] forKey:key];
        }
        
    }];
    
    return [mutableSelf copy];
}

@end
