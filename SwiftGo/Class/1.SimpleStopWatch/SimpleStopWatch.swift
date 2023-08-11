//
//  SimpleStopWatch.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/9.
//

import Foundation
import UIKit

class SimpleStopWatch: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    // 浮点数默认是Double类型，若要使用Float，需要显示声明
    var counter: Float = 0.0 {
        //属性观察器
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    
    // 给予timer一个默认值，这样timer就不会为Optional,
    // 后续可以不用再解包
    // var timer = Timer()
    
    // 这样定义可以在不用timer时回收内存
    var timer: Timer? = Timer()
    var isPlaying = false
    
    // 知识点：存储属性和计算属性
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // 只读计算属性，可以去掉get和花括号
//        get {
//            return UIStatusBarStyle.lightContent
//        }
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 符合LosslessStringConvertible协议的，
        // 都可以直接初始化一个String对象
        // timeLabel.text = String(counter)
        
        // 改成使用属性观察器监控和响应属性值的变化
        counter = 0.0
    }
    
    //_代表省略参数标签，你可以更集中地关注传递的值，而不需要在函数调用中显式指定参数标签
    @IBAction func resetClick(_ sender: UIButton) {
        /*
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
         
        等同于
        
        timer?.invalidate()
         */
        
        timer?.invalidate()
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playClick(_ sender: UIButton) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] timer in
            
            //self? 用于处理可能为 nil 的 self 引用，特别是在闭包中。它可以帮助避免循环引用问题，因为可选链会在引用的对象被释放时自动变为 nil，从而避免强引用循环
            self?.counter += 0.1
        })
        RunLoop.main.add(timer!, forMode: .common)
        isPlaying = true
    }
    
    @IBAction func pauseClick(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false

        timer?.invalidate()
        timer = nil
        isPlaying = false
    }
    
}
