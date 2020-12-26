//
//  FMHomeVipGridTableViewCell.swift
//  demoSwift
//
//  Created by asdc on 2020/1/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let FMVipGridCollectionViewCellID = "FMVipGridCollectionViewCell"

class FMHomeVipGridTableViewCell: UITableViewCell {
    
    var vipContentListGridArr: [FMContentListGridModel]?
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (LXScreenWidth - 6 * 4) / 5, height: CGFloat(FMHomeVipSectionGridHeight - 8))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib.init(nibName: "FMVipGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FMVipGridCollectionViewCellID)
        
        return collectionView
    }()
    
    func setupCollectionView() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var vipContentListGridSources: [FMContentListGridModel]? {
        didSet {
            guard let vipContentListGridArr = vipContentListGridSources else {
                return
            }
            
            self.vipContentListGridArr = vipContentListGridArr
            self.collectionView.reloadData()
        }
    }
    
}

extension FMHomeVipGridTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vipContentListGridArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FMVipGridCollectionViewCellID, for: indexPath) as! FMVipGridCollectionViewCell
        cell.contentListGridModel = self.vipContentListGridArr?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
