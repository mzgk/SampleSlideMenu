//
//  ViewController.swift
//  SlideMenuSample
//
//  Created by 水垣岳志 on 2015/11/22.
//  Copyright © 2015年 mzgk. All rights reserved.
//

/*****
# スワイプ操作で画面左からSlideMenuを表示させる
簡単なSlideMenuが欲しかったが、OSSは大袈裟なものが多かったので。
## 方法
- ViewControllerにContanierViewを追加する
- ContanierViewのAutoLayoutを設定する
    - 重要：表示サイズをどの程度にするか（Equal Width = SuperViewに対して80%）
- 表示／非表示はフラグ（isContanierShown）で制御
- 表示／非表示はContanierViewのleading.space（左端の制約）を操作する
    - 0：表示中
    - マイナスContanierView.width：画面外
- 初期表示はviewDidload()ではなく、viewDidLayoutSubviews()で行う
    - contanierViewのレイアウトが済むのがこのタイミングなので
*****/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewLeading: NSLayoutConstraint!
    var isContainerShown = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /// レイアウトが終了したタイミングでcontanierViewの表示制御を行う
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showContainerView(isContainerShown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// 右スワイプでContainerViewを表示／非表示させる
    @IBAction func rightSwipeGesture(sender: UISwipeGestureRecognizer) {
        isContainerShown = !isContainerShown
        showContainerView(isContainerShown)
    }

    /// 右スワイプでContainerViewを表示／非表示させる
    @IBAction func leftSwipeGesture(sender: UISwipeGestureRecognizer) {
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
