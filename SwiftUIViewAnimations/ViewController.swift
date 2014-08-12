//
//  ViewController.swift
//  SwiftUIViewAnimations
//
//  Created by user on 8/11/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var baseketTop: UIImageView!
    @IBOutlet weak var basketBottom: UIImageView!
    @IBOutlet weak var fabricTop: UIImageView!
    @IBOutlet weak var fabricBottom: UIImageView!
    @IBOutlet weak var bug: UIImageView!
    
    //variables
    var isBugDead = false
    
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
    
    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.0, delay: 1.2, options: .CurveEaseOut, animations: {
            
            //get the images current frame
            var fabricTopFrame = self.fabricTop.frame
            
            //move frames origin by its height
            fabricTopFrame.origin.y -= fabricTopFrame.size.height
            
            var fabricBottomFrame =  self.fabricBottom.frame
            fabricBottomFrame.origin.y += fabricBottomFrame.size.height
            
            //set the new frames
            self.fabricTop.frame = fabricTopFrame
            self.fabricBottom.frame = fabricBottomFrame
            
            
            }, completion: { finished in
                println("Napkins opened!")
        })
        
        moveBugLeft()
        
        //create tap gesture and add to view
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func moveBugLeft() {
        if isBugDead { return }
        
        UIView.animateWithDuration(1.0, delay: 2.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: {
            self.bug.center = CGPoint(x: 75, y: 200)
            
            }, completion: { finished in self.faceBugRight() })
    }
    
    func faceBugRight() {
        if isBugDead { return }
        
        UIView.animateWithDuration(1.0, delay: 0.0, options:.CurveEaseInOut | .AllowUserInteraction , animations: {
            self.bug.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        
            }, completion: { finished in self.moveBugRight() })
    }
    
    func moveBugRight() {
        
        if isBugDead { return }
        
        UIView.animateWithDuration(1.0, delay: 2.0, options: .CurveEaseInOut | .AllowUserInteraction , animations: {
            self.bug.center = CGPoint(x: 230, y: 250)
            }, completion: {
            finished in self.faceBugLeft()
        })
        
    }
    
    func faceBugLeft(){
         if isBugDead { return }
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: {
            self.bug.transform = CGAffineTransformMakeRotation(0.0)
            }, completion: {
                finished in  self.moveBugLeft()
        })
    }
    
    func handleTap(gesture:UITapGestureRecognizer){
        let tapLocation = gesture.locationInView(bug.superview)
        
        if bug.layer.presentationLayer().frame.contains(tapLocation) {
            println("Bug tapped")
        }else {
            println("Bug not tapped")
        }
    }
}





















