//
//  NSDictionary+NullReplacement.h
//  21DigitalPaperiPad
//
//  Created by 何峙 on 14-6-2.
//  Copyright (c) 2014年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullReplacement)

- (NSDictionary *)dictionaryByReplaceNullWithBlankString;

@end
