//
//  CarouselEffect.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/14.
//

import Foundation
import UIKit

class CarouselEffect: UIViewController {
    
    static var cellId = "CarouselCollectionViewCell"
    static var cellPadding = 20
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var currentUserProfileImageButton: UIButton!
    @IBOutlet weak var currentUSerFullNameButton: UIButton!
    
    // 访问权限分五种：private，fileprivate，internal，public 和 open
    // private：只能在本类的作用域且在当前文件内能访问
    // fileprivate：只能在当前文件内能访问
    // internal：本module内能访问
    // public：跨module访问但不能重写或继承
    // open：跨module访问并且能重写或继承
    fileprivate var carousels = Carouse.createCarouses()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CarouselEffect.cellId, bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: CarouselEffect.cellId)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
}

extension CarouselEffect: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carousels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CarouselEffect.cellId, for: indexPath) as! CarouselCollectionViewCell
        
        cell.carouse = carousels[indexPath.item]
        
        return cell
    }
}

extension CarouselEffect: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(UIScreen.main.bounds.width) - CarouselEffect.cellPadding * 2, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CarouselEffect.cellPadding * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: CGFloat(CarouselEffect.cellPadding), bottom: 0, right: CGFloat(CarouselEffect.cellPadding))
    }
}

extension CarouselEffect: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let originPoint = targetContentOffset.pointee
        var index = Int(originPoint.x / UIScreen.main.bounds.width)
        let offSet = Int(originPoint.x) % Int(UIScreen.main.bounds.width)
        index += (offSet > Int(UIScreen.main.bounds.width / 2) ? 1 : 0)
        targetContentOffset.pointee = CGPoint(x: index * Int(UIScreen.main.bounds.width), y: 0)
    }
}
