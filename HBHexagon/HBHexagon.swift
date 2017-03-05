//
//  HBHexagon.swift
//  HBHexagon
//
//  Created by 胡博 on 15/6/4.
//  Copyright (c) 2015年 bill. All rights reserved.
//

import UIKit

@objc enum ImageShape: NSInteger {
    case circle = 0
    case hexagon = 1
}

extension UIImage {
    @objc var hb_hexagonImage: UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath();
        context?.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        context?.setLineWidth(1)
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        context?.move(to: CGPoint(x: rect.size.width, y: rect.size.height / 2))
        for i in 0..<6 {
            let i = CGFloat(i)
            let x = rect.size.width * sin((3 + 2 * i) * CGFloat(M_PI) / 6) / 2
            let y = rect.size.height * cos((-3 + 2 * i) * CGFloat(M_PI) / 6) / 2
            context?.addLine(to: CGPoint(x: center.x + x, y: center.y + y))
        }
        context?.closePath()
        UIBezierPath(cgPath: (context?.path!)!).addClip()
        draw(in: rect)
        let hexagonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return hexagonImage!
    }
}

@objc class HBHexagonImageView: UIImageView {
    @objc var shape: ImageShape = ImageShape.hexagon
    override var image: UIImage? {
        set {
                super.image = newValue?.hb_hexagonImage
        }
        get {
            return super.image
        }
    }
}
