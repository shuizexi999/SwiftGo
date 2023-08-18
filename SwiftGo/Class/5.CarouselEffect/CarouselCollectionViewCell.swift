//
//  CarouselCollectionViewCell.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/14.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var carouseTitleLabel: UILabel!
    
    var carouse: Carouse! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        carouseTitleLabel?.text! = carouse.title
        featuredImageView?.image! = carouse.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
