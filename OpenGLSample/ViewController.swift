//
//  ViewController.swift
//  OpenGLSample
//
//  Created by Yamamoto Kensuke on 6/5/15.
//  Copyright (c) 2015 Yamamoto Kensuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var triangleView = TriangleView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height));
        self.view.addSubview(triangleView)
    }
    
}

