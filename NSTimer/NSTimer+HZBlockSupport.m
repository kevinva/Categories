//
//  NSTimer+EOCBlockSupport.m
//  TaoLueFM
//
//  Created by ZanderHo on 15/7/7.
//  Copyright (c) 2015年 ZanderHo. All rights reserved.
//

#import "NSTimer+HZBlockSupport.h"

@implementation NSTimer (HZBlockSupport)

+ (NSTimer *)hz_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)())block {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(hz_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}


#pragma mark - Private methods

+ (void)hz_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
