//
//  ViewController.swift
//  SwiftUIViewAnimations
//
//  Created by user on 8/11/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var baseketTop: UIImageView!
    @IBOutlet weak var basketBottom: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(0.7, delay: 1.0, options: .CurveEaseOut, animations: {
            
            //get the images current frame
            var basketTopFrame = self.baseketTop.frame
            
            //move frames origin by its height
            basketTopFrame.origin.y -= basketTopFrame.size.height
            
            var basketBottomFrame =  self.basketBottom.frame
            basketBottomFrame.origin.y += basketBottomFrame.size.height
            
            //set the new frames
            self.baseketTop.frame = basketTopFrame
            self.basketBottom.frame = basketBottomFrame
            
            }, completion: { finished in
            println("Basket doors opened!")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

