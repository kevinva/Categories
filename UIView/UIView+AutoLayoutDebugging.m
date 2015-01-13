//
//  UIView+AutoLayoutDebugging.m
//  Fenba
//
//  Created by 何峙 on 14-9-2.
//  Copyright (c) 2014年 何峙. All rights reserved.
//

#import "UIView+AutoLayoutDebugging.h"

@implementation UIView (AutoLayoutDebugging)

#pragma mark - Public methods

- (void)printAutoLayoutTrace{
    
#ifdef DEBUG
    NSLog(@"%@", [self performSelector:@selector(_autolayoutTrace)]);
#endif

}

@end
