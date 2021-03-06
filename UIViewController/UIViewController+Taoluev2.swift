//
//  UIViewController+Taoluev2.swift
//  TaoLueFM
//
//  Created by ZanderHo on 16/3/29.
//  Copyright © 2016年 ZanderHo. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func lt_navTitleLabelWithText(text: String) -> UILabel {
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 44.0))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20.0)
        titleLabel.text = text
        
        return titleLabel
    }
    
    func lt_navSpaceItem() -> UIBarButtonItem {
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        let width: CGFloat = Ruler.iPhoneHorizontal(-16.0, -18.0, -21.0).value
        spaceItem.width = width
        return spaceItem
    }
    
    
    func lt_showHUDWithText(text: String?, duration: Double) {
        guard let messageText = text else {
            return
        }
        
        let bgView: UIView = {
           
            let bgView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 320.0, height: 568.0))
            bgView.backgroundColor = UIColor.clearColor()
            bgView.translatesAutoresizingMaskIntoConstraints = false
            bgView.alpha = 0.0
            
            return bgView
            
        }()
        
        var parentView = self.view
        if self.view is UITableView { //在UITableView上不能加约束布局
            parentView = UIApplication.sharedApplication().keyWindow
        }
        
        parentView.addSubview(bgView)
    
        let top = NSLayoutConstraint(item: bgView, attribute: .Top, relatedBy: .Equal, toItem: parentView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let leading = NSLayoutConstraint(item: bgView, attribute: .Leading, relatedBy: .Equal, toItem: parentView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: bgView, attribute: .Bottom, relatedBy: .Equal, toItem: parentView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: bgView, attribute: .Trailing, relatedBy: .Equal, toItem: parentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activateConstraints([top, leading, bottom, trailing])
        
        
        //
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(16.0)]
        let rect = messageText.boundingRectWithSize(CGSize(width: 300.0, height: 21.0), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        
        let width = CGRectGetWidth(rect) + 30.0
        let height = CGRectGetHeight(rect) + 30.0
        
        let transparentView: UIView = {
            
            let transparentView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            transparentView.backgroundColor = UIColor.blackColor()
            transparentView.alpha = 0.7
            transparentView.translatesAutoresizingMaskIntoConstraints = false
            transparentView.layer.cornerRadius = 5.0
            transparentView.layer.masksToBounds = true
            
            let widthConstraint = NSLayoutConstraint(item: transparentView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: width)
            let heightConstraint = NSLayoutConstraint(item: transparentView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: height)
            NSLayoutConstraint.activateConstraints([widthConstraint, heightConstraint])
            
            return transparentView
            
        }()
        bgView.addSubview(transparentView)
        
        let centerX = NSLayoutConstraint(item: transparentView, attribute: .CenterX, relatedBy: .Equal, toItem: bgView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let centerY = NSLayoutConstraint(item: transparentView, attribute: .CenterY, relatedBy: .Equal, toItem: bgView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activateConstraints([centerX, centerY])
        
        
        //
        let label: UILabel = {
           
            let label = UILabel(frame: CGRect(x: 15.0, y: 15.0, width: CGRectGetWidth(rect), height: CGRectGetHeight(rect)))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(15.0)
            label.textColor = UIColor.whiteColor()
            label.text = messageText
            return label
            
        }()
            
        bgView.addSubview(label)
        
        let labelCenterX = NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: bgView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let labelCenterY = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: bgView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let labelLeading = NSLayoutConstraint(item: label, attribute: .Leading, relatedBy: .GreaterThanOrEqual, toItem: transparentView, attribute: .Leading, multiplier: 1.0, constant: 10.0)
        let labelTrailing = NSLayoutConstraint(item: label, attribute: .Trailing, relatedBy: .GreaterThanOrEqual, toItem: transparentView, attribute: .Trailing, multiplier: 1.0, constant: -10.0)
        NSLayoutConstraint.activateConstraints([labelCenterX, labelCenterY, labelLeading, labelTrailing])
        
        //
        UIView.animateWithDuration(0.3, animations: { 
            
            bgView.alpha = 1.0
            
            }) { (finish) in
                
                self.lt_delayOnMainQueueWithSeconds(duration, task: {
                    
                    UIView.animateWithDuration(0.3, animations: { 
                        
                        bgView.alpha = 0.0
                        
                        }, completion: { (finish2) in
                            
                            bgView.removeFromSuperview()
                            
                    })
                    
                })
                
        }
    }
    
    func lt_showLoadingHUD() -> UIView {
        let bgView: UIView = {
            
            let bgView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 320.0, height: 568.0))
            bgView.backgroundColor = UIColor.clearColor()
            bgView.translatesAutoresizingMaskIntoConstraints = false
            bgView.alpha = 0.0
            
            return bgView
            
        }()
        
        var parentView = self.view
        if self.view is UITableView { //在UITableView上不能加约束布局
            parentView = UIApplication.sharedApplication().keyWindow
        }
        
        parentView.addSubview(bgView)
        
        let top = NSLayoutConstraint(item: bgView, attribute: .Top, relatedBy: .Equal, toItem: parentView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let leading = NSLayoutConstraint(item: bgView, attribute: .Leading, relatedBy: .Equal, toItem: parentView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: bgView, attribute: .Bottom, relatedBy: .Equal, toItem: parentView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: bgView, attribute: .Trailing, relatedBy: .Equal, toItem: parentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activateConstraints([top, leading, bottom, trailing])
        
        
        //
        let width: CGFloat = 60.0
        let height: CGFloat = 60.0
        let transparentView: UIView = {
            
            let transparentView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            transparentView.backgroundColor = UIColor.blackColor()
            transparentView.alpha = 0.7
            transparentView.translatesAutoresizingMaskIntoConstraints = false
            transparentView.layer.cornerRadius = 5.0
            transparentView.layer.masksToBounds = true
            
            let widthConstraint = NSLayoutConstraint(item: transparentView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: width)
            let heightConstraint = NSLayoutConstraint(item: transparentView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: height)
            NSLayoutConstraint.activateConstraints([widthConstraint, heightConstraint])
            
            return transparentView
            
        }()
        bgView.addSubview(transparentView)
        
        let centerX = NSLayoutConstraint(item: transparentView, attribute: .CenterX, relatedBy: .Equal, toItem: bgView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let centerY = NSLayoutConstraint(item: transparentView, attribute: .CenterY, relatedBy: .Equal, toItem: bgView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activateConstraints([centerX, centerY])
        
        
        //
        let indicator: UIActivityIndicatorView = {
           
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.startAnimating()
            return indicator
            
        }()
        bgView.addSubview(indicator)
        
        let indicatorCenterX = NSLayoutConstraint(item: indicator, attribute: .CenterX, relatedBy: .Equal, toItem: bgView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let indicatorCenterY = NSLayoutConstraint(item: indicator, attribute: .CenterY, relatedBy: .Equal, toItem: bgView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activateConstraints([indicatorCenterX, indicatorCenterY])
        
        self.view.layoutIfNeeded()
        
        //
        UIView.animateWithDuration(0.3) { 
            
            bgView.alpha = 1.0
            
        }
        
        return bgView
    }
}
