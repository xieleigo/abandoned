//
//  FMVipGridCollectionViewCell.swift
//  demoSwift
//
//  Created by asdc on 2020/1/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class FMVipGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fmImageView: UIImageView!
    @IBOutlet weak var fmTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var contentListGridModel: FMContentListGridModel? {
        didSet {
            guard let gridModel = contentListGridModel else {
                return
            }
            
            self.fmImageView.kf.setImage(with: URL(string: gridModel.coverPath!))
            self.fmTitleLabel.text = gridModel.title
        }
    }
}
