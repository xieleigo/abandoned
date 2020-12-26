
//
//  FMHomeVipViewController.swift
//  demoSwift
//
//  Created by asdc on 2019/12/27.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import MBProgressHUD
import SVProgressHUD

let FMHomeVipSectionBanner = 0
let FMHomeVipSectionGrid = 1

class FMHomeVipViewController: UIViewController {
    
    private let FMHomeVipHeaderViewID = "FMHomeVipHeaderView"
    private let FMHomeVipFooterViewID = "FMHomeVipFooterView"
    private let FMHomeVipBannerTableViewCellID = "FMHomeVipBannerTableViewCell"
    private let FMHomeVipGridTableViewCellID = "FMHomeVipGridTableViewCell"

    lazy var viewModel: FMHomeVipViewModel = {
        return FMHomeVipViewModel()
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: LXScreenWidth, height: LXScreenHeight - LXNavBarHeight),
                                         style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(FMHomeVipHeaderView.self, forHeaderFooterViewReuseIdentifier: FMHomeVipHeaderViewID)
        tableView.register(FMHomeVipFooterView.self, forHeaderFooterViewReuseIdentifier: FMHomeVipFooterViewID)
        tableView.register(FMHomeVipBannerTableViewCell.self, forCellReuseIdentifier: FMHomeVipBannerTableViewCellID)
        tableView.register(FMHomeVipGridTableViewCell.self, forCellReuseIdentifier: FMHomeVipGridTableViewCellID)
        
        tableView.uHead = URefreshHeader {[weak self] in
            self?.setupLoadData()
        }
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadData()
        self.view.addSubview(self.tableView)
        //self.tableView.uHead.beginRefreshing()
    }
    
    func setupLoadData() {
        viewModel.updateBlock = {[unowned self] in
            self.tableView.uHead.endRefreshing()
            self.tableView.reloadData()
        }
        viewModel.refreshDataSource()
    }
}

extension FMHomeVipViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.vipCategoryContentsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case FMHomeVipSectionBanner:
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomeVipBannerTableViewCellID, for: indexPath) as! FMHomeVipBannerTableViewCell
            cell.vipBannerSources = viewModel.vipFocusImagesData
            cell.delegate = self
            return cell
            
        case FMHomeVipSectionGrid:
            let cell = tableView.dequeueReusableCell(withIdentifier: FMHomeVipGridTableViewCellID, for: indexPath) as! FMHomeVipGridTableViewCell
            cell.vipContentListGridSources = viewModel.vipContentListGrid
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
            cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
            cell.textLabel?.lineBreakMode = .byCharWrapping
            cell.textLabel?.text = "11111"
            cell.textLabel?.numberOfLines = 2
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: FMHomeVipHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FMHomeVipHeaderViewID) as! FMHomeVipHeaderView
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.red
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.heightForFooterInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: FMHomeVipFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FMHomeVipFooterViewID) as! FMHomeVipFooterView
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.orange
    }
}

extension FMHomeVipViewController: FMHomeVipBannerTableViewCellDelegate {
    func homeVipBannerTableViewCell(homeVipBannerTableViewCell: FMHomeVipBannerTableViewCell, didSelectAtUrlString: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "loading"
        hud.hide(animated: true, afterDelay: 3.0)
    }
}
