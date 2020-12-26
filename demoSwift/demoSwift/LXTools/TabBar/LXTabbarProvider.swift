//
//  LXTabbarProvider.swift
//  demoSwift
//
//  Created by asdc on 2019/12/26.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import ESTabBarController_swift

enum LXTabbarProvider {
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.tabBar.shadowImage = nil
            
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    static func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> LXNavigationController {
          let tabBarController = ESTabBarController()
          tabBarController.delegate = delegate
          tabBarController.title = "Irregularity"
          tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
          tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
          tabBarController.shouldHijackHandler = {
              tabbarController, viewController, index in
              if index == 2 {
                  return true
              }
              return false
          }
          tabBarController.didHijackHandler = {
              [weak tabBarController] tabbarController, viewController, index in
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                  let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                  alertController.addAction(takePhotoAction)
                  let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                  alertController.addAction(selectFromAlbumAction)
                  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                  alertController.addAction(cancelAction)
                  tabBarController?.present(alertController, animated: true, completion: nil)
              }
          }

          let v1 = FMHomeVipViewController()
          let v2 = ExampleViewController()
          let v3 = ExampleViewController()
          let v4 = ExampleViewController()
          let v5 = LXAlgorithmViewController()
          
          v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
          v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
          v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
          v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
          v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
          
          tabBarController.viewControllers = [v1, v2, v3, v4, v5]
          
          let navigationController = LXNavigationController.init(rootViewController: tabBarController)
          tabBarController.title = "Example"
          return navigationController
      }
}
