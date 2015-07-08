//
//  NSObject+Nametags.m
//  TaoLueFM
//
//  Created by ZanderHo on 15/7/8.
//  Copyright (c) 2015年 ZanderHo. All rights reserved.
//

#import "NSObject+Nametags.h"
#import <objc/runtime.h>

@implementation NSObject (Nametags)

- (NSString *)nametag {
    return objc_getAssociatedObject(self, @selector(nametag));
}

- (void)setNametag:(NSString *)nametag {
    objc_setAssociatedObject(self, @selector(nametag), nametag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
