//
//  UIView+DebugDescription.m
//  TaoLueFM
//
//  Created by ZanderHo on 15/7/8.
//  Copyright (c) 2015年 ZanderHo. All rights reserved.
//

#import "UIView+DebugDescription.h"

@implementation UIView (DebugDescription)

- (NSString *)viewLayoutDescription {
    NSMutableString *desc = [NSMutableString string];
    
    [desc appendFormat:@"<%@> %@: %@", self, self.class.description, self.superclass.description];
    
    if (self.translatesAutoresizingMaskIntoConstraints) {
        [desc appendFormat:@"   [Autosizes]"];
    }
    if (self.hasAmbiguousLayout) {
        [desc appendFormat:@"   [Caution: Ambiguous Layout!]"];
    }
    [desc appendFormat:@"\n"];
    
    if (self.translatesAutoresizingMaskIntoConstraints && self.autoresizingMask != 0) {
        [desc appendFormat:@"Mask......%lu\n", (unsigned long)self.autoresizingMask];
    }
    
    [desc appendFormat:@"Frame......%@\n", NSStringFromCGRect(self.frame)];
    [desc appendFormat:@"Content size...%@", NSStringFromCGSize(self.intrinsicContentSize)];
    
#if TARGET_OS_IPHONE
    if ((self.intrinsicContentSize.width > 0) || (self.intrinsicContentSize.height > 0)) {
        [desc appendFormat:@"   [Content Mode: %ld]", (long)self.contentMode];
    }
#endif
    [desc appendFormat:@"\n"];
    
    [desc appendFormat:@"Hugging......[H %f] [V %f]\n", [self contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal], [self contentHuggingPriorityForAxis:UILayoutConstraintAxisVertical]];
    
    [desc appendFormat:@"Resistance...[H %f] [V %f]\n", [self contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal], [self contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisVertical]];
    
    [desc appendFormat:@"Constraints....%lu\n", (unsigned long)self.constraints.count];
    
    int i = 1;
    for (NSLayoutConstraint *constraint in self.constraints) {
        BOOL isLayoutConstraint = [constraint.class isEqual:[NSLayoutConstraint class]];
        
        [desc appendFormat:@"%2d. ", i++];
        
        if (isLayoutConstraint) {
            [desc appendFormat:@"@%4d ", (int)constraint.priority];
        }
        
        [desc appendFormat:@"%@", constraint];
        
        if (!isLayoutConstraint) {
            [desc appendFormat:@" (%@)", constraint.class.description];
        }
        
        [desc appendFormat:@"\n"];
    }
    
    return desc;
}

@end
