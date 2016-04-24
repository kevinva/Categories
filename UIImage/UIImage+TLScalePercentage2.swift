//
//  UIImage+TLScalePercentage2.swift
//  TaoLueFM
//
//  Created by ZanderHo on 16/1/6.
//  Copyright © 2016年 ZanderHo. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageByScalingWith(Ratio ratio: CGFloat) -> UIImage {
        if (ratio < 0.0 || ratio > 1.0) {
            return self;
        }
        
        let newSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
        UIGraphicsBeginImageContext(newSize);
        
        self.drawInRect(CGRectMake(0.0, 0.0, newSize.width, newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return newImage;
    }
}
