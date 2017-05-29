//
//  ModifyViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class ModifyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    var startTextField, endTextField, titleTextField, importanceTextField: UITextField!
    var doneButton: UIButton!
    func initializeView() {
        view.backgroundColor = .white
        
        /*
         TODO: 2
         完成本页其它界面
         */
    }
    
    func done() {
        let documentPath = NSHomeDirectory() + "/Documents"
        let task = NSDictionary(contentsOfFile: documentPath + "/task")
        
        /*
         TODO: 2
         处理任务添加和修改
         */
        
        navigationController?.popViewController(animated: true)
    }
}
