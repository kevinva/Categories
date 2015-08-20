//
//  NSTimer+EOCBlockSupport.h
//  TaoLueFM
//
//  Created by ZanderHo on 15/7/7.
//  Copyright (c) 2015年 ZanderHo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (HZBlockSupport)

+ (NSTimer *)hz_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)())block;

@end
