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

        let triangleView = TriangleView(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height));
        self.view.addSubview(triangleView)
    }
    
}

