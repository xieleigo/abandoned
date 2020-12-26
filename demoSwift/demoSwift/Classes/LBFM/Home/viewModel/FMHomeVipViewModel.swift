//
//  FMHomeVipViewModel.swift
//  demoSwift
//
//  Created by asdc on 2019/12/27.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

let FMHomeVipSectionGridHeight = 80.0


class FMHomeVipViewModel: NSObject {
    var homeVipData: FMHomeVipModel?
    var vipFocusImagesData: [FMVipFocusImagesData]?
    var vipCategoryContentsList: [FMCategoryContentsList]?
    var vipContentListGrid: [FMContentListGridModel]?
    
    // 数据源更新
    typealias homeVipDataBlock = () -> Void
    var updateBlock: homeVipDataBlock?
    
    func numberOfRowsInSection(section: Int) -> Int {
        return 1
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case FMHomeVipSectionBanner:
            return 150
        case FMHomeVipSectionGrid:
            return CGFloat(FMHomeVipSectionGridHeight)
        
        default:
            return 120
        }
    }
    
    func heightForHeaderInSection(section: Int) -> CGFloat {
        switch section {
        case FMHomeVipSectionBanner:
            return 0.0
        case FMHomeVipSectionGrid:
            return 0.0
            
        default:
            return 44
        }
    }
    
    func heightForFooterInSection(section: Int) -> CGFloat {
        switch section {
        case FMHomeVipSectionBanner:
            return 0.0
        case FMHomeVipSectionGrid:
            return 10
        
        default:
            return 64
        }
    }
}

extension FMHomeVipViewModel {
    func refreshDataSource() {
        FMHomeVipAPIProvider.request(FMHomeVipAPI.homeVipList) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print(json.description)
                
                if let mappedObject = JSONDeserializer<FMHomeVipModel>.deserializeFrom(json: json.description) {
                    self.homeVipData = mappedObject
                    self.vipFocusImagesData = mappedObject.focusImages?.data
                    self.vipCategoryContentsList = mappedObject.categoryContents?.list
                }
                
                if let contentListGridObject = JSONDeserializer<FMContentListGridModel>.deserializeModelArrayFrom(json: json["categoryContents"]["list"][0]["list"].description) {
                    self.vipContentListGrid = contentListGridObject as? [FMContentListGridModel]
                }

                self.updateBlock?()
            }
        }
    }
}
