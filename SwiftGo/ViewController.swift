//
//  ViewController.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/9.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var cellId = "YKCell"
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuTitleArr = ["SimpleStopWatch",
                        "CustomFont",
                        "PlayLocalVideo",
                        "SnapChatMenu",
                        "CarouselEffect",
                        "FindMyLocation",
                        "PullToRefresh",
                        "RandomGradientColorMusic",
                        "ImageScroller",
                        "VideoBackground",
                        "ClearTableViewCell",
                        "LoginAnimation",
                        "AnimateTableViewCell",
                        "EmojiSlotMachine",
                        "AnimatedSplash",
                        "SlideMenu",
                        "TumblrMenu",
                        "LimitCharacters",
                        "CustomPullToRefresh",
                        "CollectionViewAnimation",
                        "SwipeableCell",
                        "3DTouchQuickAction",
                        "SlideOutMenu",
                        "MosaicLayout",
                        "UIViewBasicAnimation",
                        "CoreDataApp",
                        "TabbarApp",
                        "SpotlightSearch",
                        "iMessageImagePicker",
                        "WikiFace"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "SwiftGo"
        
        let nib = UINib(nibName: "YKCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: ViewController.cellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = menuTableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath)
        let cell = menuTableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as! YKCell
        
//        cell.textLabel?.text = String(indexPath.row)
//        cell.textLabel?.textColor = UIColor.black
        
        cell.titleLabel.text = String(indexPath.row + 1) + "." + menuTitleArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc1 = SimpleStopWatch()
            navigationController?.pushViewController(vc1, animated: true)
            
        } else if indexPath.row == 1 {
//            let vc2 = CustomFont()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc2 = storyboard.instantiateViewController(withIdentifier: "CustomFont")
            navigationController?.pushViewController(vc2, animated: true)
            
        } else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc3 = storyboard.instantiateViewController(withIdentifier: "PlayLocalVideo")
            navigationController?.pushViewController(vc3, animated: true)
            
        } else if indexPath.row == 3 {
            let vc4 = SnapChatMenu()
            navigationController?.pushViewController(vc4, animated: true)
            
        }
    }
}

