//
//  NSString+CleanSpecailChar.h
//  Biando
//
//  Created by biando on 12-12-27.
//  Copyright (c) 2012年 biando. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CleanSpecailChar)

/**
 *  @brief  清除字符串两端的空格
 */
- (NSString *)cleanWhiteSpace;

/**
 *  @brief  清除字符串两端的空格，和/r, /n, (一般情况下，解释xml时用)
 */
- (NSString *)trimBothEndWhiteSpace;

/**
 *  @brief  格式化从网络下载的字符串中的特殊字符，如/b，/f，/n，/r，/t和双引号"
 */
- (NSString *)formatWebChar;

/**
 *  @brief  清除字符串中的特殊字符，用空白字符代替（慎用）
 */
- (NSString *)cleanWebCharWithWhiteSpace;

/**
 *  @brief  格式化http形式的字符串
 */
- (NSString *)filenameFromUrl;

/**
 *  @brief  将字符串变为http地址的形式
 */
- (NSString *)urlFromFilename;


@end
