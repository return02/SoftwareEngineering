//
//  FriendViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }

    func initializeView() {
        view.backgroundColor = .white
        title = "好友"
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = item
        
        /*
         应该不用完成本页其它界面
         */
    }
}
