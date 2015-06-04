//
//  ViewController.swift
//  HBHexagon
//
//  Created by 胡博 on 15/6/4.
//  Copyright (c) 2015年 bill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    override func loadView() {
        super.loadView()
        avatar.image = UIImage(named: "Avatar")?.hb_hexagonImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

