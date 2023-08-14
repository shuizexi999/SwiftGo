//
//  SnapChatMenu.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/14.
//

import Foundation
import UIKit

class SnapChatMenu: UIViewController {
    
    @IBOutlet weak var menuScrollView: UIScrollView!
    
    var leftView: UIViewController!
    var cameraView: SCameraView!
    var rightView: SRightView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftView = UINib(nibName: "SLeftView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIViewController
        cameraView = SCameraView()//SCameraView(nibName: "SCameraView", bundle: nil)
        rightView = SRightView()
        
        menuScrollView.contentInsetAdjustmentBehavior = .never //消除scrollview顶部空白
        
        menuScrollView.addSubview(leftView.view)
        menuScrollView.addSubview(cameraView.view)
        menuScrollView.addSubview(rightView.view)
        
        addChild(leftView)
        addChild(cameraView)
        addChild(rightView)
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        menuScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        leftView.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        cameraView.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightView.view.frame = CGRect(x: screenWidth * 2, y: 0, width: screenWidth, height: screenHeight)
        
        menuScrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
