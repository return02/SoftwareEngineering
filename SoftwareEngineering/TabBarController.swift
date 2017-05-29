//
//  TabBarController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cVC = CalendarViewController()
        let cItem = UITabBarItem(title: "日历", image: nil, tag: 0)
        cVC.tabBarItem = cItem
        
        let tVC = UINavigationController(rootViewController: TaskViewController())
        let tItem = UITabBarItem(title: "任务", image: nil, tag: 1)
        tVC.tabBarItem = tItem
        
        let fVC = UINavigationController(rootViewController: FriendViewController())
        let fItem = UITabBarItem(title: "好友", image: nil, tag: 2)
        fVC.tabBarItem = fItem
        
        let sVC = SettingsViewController()
        let sItem = UITabBarItem(title: "我", image: nil, tag: 3)
        sVC.tabBarItem = sItem
        
        viewControllers = [cVC, tVC, fVC, sVC]
    }
}
