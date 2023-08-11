//
//  CustomFont.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/10.
//

import Foundation
import UIKit

class CustomFont: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var fontTableView: UITableView!
    
    static var cellId = "FontCell"
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    var fontArray = ["Gaspar Regular",
                     "Zapfino",
                     "MFZhiHei_Noncommercial-Regular",
                     "MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular"]
    
    var fontIndex = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeFontLabel.layer.cornerRadius = 50
        changeFontLabel.layer.masksToBounds = true
        changeFontLabel.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changFontGesture(_:)))
        changeFontLabel.addGestureRecognizer(gesture)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fontTableView.dequeueReusableCell(withIdentifier: CustomFont.cellId, for: indexPath)
        
        let cellTitle = data[indexPath.row]
        
        cell.textLabel?.text = cellTitle
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontArray[fontIndex], size: 16)
        
        return cell
    }
    
    @objc func changFontGesture(_ sender: AnyObject) {
        fontIndex = (fontIndex + 1) % 5
        print(fontArray[fontIndex])
        fontTableView?.reloadData()
    }
}
