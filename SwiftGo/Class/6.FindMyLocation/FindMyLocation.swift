//
//  FindMyLocation.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/25.
//

import Foundation
import UIKit
import CoreLocation

class FindMyLocation: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    // 强制自动解包，可以赋值为nil，为nil后再调用会报错
    // 建议定义为：
    // var locationManager: CLLocationManager
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func locationClick(_ sender: AnyObject) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}
