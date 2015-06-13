//
//  HBHexagon.swift
//  HBHexagon
//
//  Created by 胡博 on 15/6/4.
//  Copyright (c) 2015年 bill. All rights reserved.
//

import UIKit

//class HBHexagon: UIView {
//    static func makeHexagonImage() {
//        
//    }
//}

@objc enum ImageShape: NSInteger {
    case Circle = 0
    case Hexagon = 1
}

extension UIImage {
    @objc var hb_hexagonImage: UIImage {
        let rect = CGRect(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context);
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 1)
        let center = CGPointMake(rect.size.width / 2, rect.size.height / 2)
        CGContextMoveToPoint(context, rect.size.width, rect.size.height / 2)
        for i in 0..<6 {
            let i = CGFloat(i)
            let x = rect.size.width * sin((3 + 2 * i) * CGFloat(M_PI) / 6) / 2
            let y = rect.size.height * cos((-3 + 2 * i) * CGFloat(M_PI) / 6) / 2
            CGContextAddLineToPoint(context, center.x + x, center.y + y)
        }
        CGContextClosePath(context)
        UIBezierPath(CGPath: CGContextCopyPath(context)).addClip()
        drawInRect(rect)
        let hexagonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return hexagonImage
    }
}

@objc class HBHexagonImageView: UIImageView {
    @objc var shape: ImageShape = ImageShape.Hexagon
    override var image: UIImage? {
        set {
            if shape == ImageShape.Hexagon {
                super.image = newValue?.hb_hexagonImage
            } else {
                super.image = newValue?.msr_roundedImage
            }
        }
        get {
            return super.image
        }
    }
}
