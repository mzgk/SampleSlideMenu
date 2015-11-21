//
//  ViewController.swift
//  SlideMenuSample
//
//  Created by 水垣岳志 on 2015/11/22.
//  Copyright © 2015年 mzgk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewLeading: NSLayoutConstraint!
    var isContainerShown = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showContainerView(isContainerShown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 左端のPanGestureでContainerViewを表示させる
    @IBAction func leftEdgePanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        isContainerShown = !isContainerShown
        showContainerView(isContainerShown)
    }
    
    
    /**
    containerViewの表示制御
    
    - parameters:
        - shown: Bool
    */
    private func showContainerView(shown: Bool) {
        var newConstant: CGFloat
        
        if isContainerShown {
            newConstant = 0
        }
        else {
            newConstant = -containerView.bounds.width
        }

        UIView.animateWithDuration(0.3,
            animations: { () -> Void in
                self.containerViewLeading.constant = newConstant
                self.view.layoutIfNeeded()
            },
            completion: nil)
    }
}

