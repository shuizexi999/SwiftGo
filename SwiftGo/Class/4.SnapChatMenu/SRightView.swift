//
//  SRightView.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/14.
//

import Foundation
import UIKit

class SRightView: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // UIApplication.shared.isStatusBarHidden = true

        // Do any additional setup after loading the view.
        
        self.view.addObserver(self, forKeyPath: "frame", context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "frame") {
            imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width * 667.0 / 375.0)
        }
    }
    
    deinit {
        //移除观察者
        self.view.removeObserver(self, forKeyPath: "frame")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
