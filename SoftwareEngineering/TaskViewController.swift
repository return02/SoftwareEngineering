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
        for t in tasks!{
            task.append(t as! NSDictionary)
        }
        print("task: \(task)")
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
//        cell.textLabel?.text = "\(indexPath.row)"
        
        /*
         TODO: 4
         需要根据任务显示的需要来自定义样式
         */
        let t = task[indexPath.row]
        let endDate = t["endDate"] as! String
        let startDate = t["startDate"] as! String
        let importance = t["importance"] as! Int
        var importance_stars = String()
        for _ in 1...importance{
            importance_stars += "*"
            // 暂时先这样，改天改成图片。。
        }
        let title = t["title"] as! String
        let user = t["user"] as! Int
        let taskNumber = t["task"] as! Int
        // Q: 这两个整型是什么意思，如何显示 --zcg
        cell.textLabel?.text = "\(title):     \(importance_stars)     \(startDate)~\(endDate)"
        // TODO: 左右对齐
        
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
        task.remove(at: indexPath.row)
        print("task: \(task)")
        tableView.reloadData()
        // TODO: 从文件中把任务删除
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}
