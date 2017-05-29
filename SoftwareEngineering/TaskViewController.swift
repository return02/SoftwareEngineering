//
//  TaskViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        initializeData()
    }
    
    var width, height: CGFloat!
    var tableView: UITableView!
    func initializeView() {
        view.backgroundColor = .white
        title = "任务"
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = item
        
        width = view.frame.width
        height = view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: height * 0.2, width: width, height: height * 0.6))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        view.addSubview(tableView)
    }
    
    var task = [NSDictionary]()
    func initializeData()
    {
        let documentPath = NSHomeDirectory() + "/Documents"
        let tasks = NSArray(contentsOfFile: documentPath + "/task")
        
        /*
         TODO: 4
         准备当前用户的任务数据并存在task中
         */
    }
    
    func addTask() {
        let mVC = ModifyViewController()
        
        /*
         TODO: 2
         参数准备
         */
        
        navigationController?.pushViewController(mVC, animated: true)
    }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        //cell.textLabel?.text = "\(indexPath.row)"
        
        /*
         TODO: 4
         需要根据任务显示的需要来自定义样式
         */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        /*
         TODO: 4
         从task中删除任务
         */
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}
