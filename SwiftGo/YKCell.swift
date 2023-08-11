//
//  YKCell.swift
//  SwiftGo
//
//  Created by 杨翊楷 on 2023/8/9.
//

import UIKit

class YKCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initSubViews()
    }
    
    func initSubViews() {
        
    }
}
