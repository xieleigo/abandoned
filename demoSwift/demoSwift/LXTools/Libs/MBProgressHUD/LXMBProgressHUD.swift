//
//  LXMBProgressHUD.swift
//  demoSwift
//
//  Created by asdc on 2020/1/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension MBProgressHUD {
    class func showWithText(text: String, view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.text;
        hud.label.text = text;
        hud.label.numberOfLines = 0;
        hud.label.textAlignment = NSTextAlignment.left;
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor;
        hud.contentColor = UIColor.white;
        hud.bezelView.backgroundColor = UIColor.black.withAlphaComponent(0.7);
        hud.removeFromSuperViewOnHide = true;
        hud.hide(animated: true, afterDelay: 1.5)
    }
}

