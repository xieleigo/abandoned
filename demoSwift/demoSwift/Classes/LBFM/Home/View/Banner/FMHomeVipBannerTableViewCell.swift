//
//  FMHomeVipBannerTableViewCell.swift
//  demoSwift
//
//  Created by asdc on 2019/12/31.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import FSPagerView
import SnapKit
import Kingfisher

protocol FMHomeVipBannerTableViewCellDelegate: NSObjectProtocol {
    func homeVipBannerTableViewCell(homeVipBannerTableViewCell: FMHomeVipBannerTableViewCell, didSelectAtUrlString: String)
}

class FMHomeVipBannerTableViewCell: UITableViewCell {
    
    weak var delegate: FMHomeVipBannerTableViewCellDelegate?
    
    var vipBannerArr: [FMVipFocusImagesData]?
    
    private let FSPagerViewCellID = "FMHomeVipBannerTableViewCell"
    
    private lazy var pageView: FSPagerView = {
        let pageView = FSPagerView()
        pageView.dataSource = self
        pageView.delegate = self
        pageView.automaticSlidingInterval = 3
        pageView.isInfinite = true
        pageView.interitemSpacing = 15
        pageView.transformer = FSPagerViewTransformer(type: .linear)
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: FSPagerViewCellID)
        
        return pageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPageView()
    }
    
    func setupPageView() {
        self.addSubview(self.pageView)
        self.pageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        self.pageView.itemSize = CGSize(width: LXScreenWidth - 60, height: 140)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var vipBannerSources: [FMVipFocusImagesData]? {
        didSet {
            guard let modelArr = vipBannerSources else {
                return
            }
            
            self.vipBannerArr = modelArr
            self.pageView.reloadData()
        }
    }
}


extension FMHomeVipBannerTableViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.vipBannerArr?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: FSPagerViewCellID, at: index)
        cell.imageView?.kf.setImage(with: URL(string: self.vipBannerArr?[index].cover ?? ""))
        
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let urlString = self.vipBannerArr?[index].link ?? ""
        delegate?.homeVipBannerTableViewCell(homeVipBannerTableViewCell: self, didSelectAtUrlString: urlString)
    }
}
