//
//  CalendarViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    var width, height: CGFloat!
    var collectionView: JTAppleCalendarView!
    var taskTableView: UITableView!
    var monthLabel: UILabel!
    var taskArray: [UITableViewCell]!
    var info = [
        ["task1", "task2"],
        ["task3", "task4"],
        ["task5", "task6"]
    ]
//    var startDate, endDate: Date!
    func initializeView() {
        width = view.frame.width
        height = view.frame.height
        print(height)
        
        view.backgroundColor = .white
        
        collectionView = JTAppleCalendarView(frame: CGRect(x: 0, y: height * 0.1, width: width, height: height * 0.5))
//        collectionView.text
        collectionView.backgroundColor = .white
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.ibCalendarDelegate = self
        collectionView.ibCalendarDataSource = self
        collectionView.minimumInteritemSpacing = 0
        collectionView.minimumLineSpacing = 0
        collectionView.scrollDirection = .horizontal
        view.addSubview(collectionView)
        
        collectionView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupCalender(from: visibleDates)
        }
        
        monthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height * 0.1))
//        monthLabel.text = "六月"
        monthLabel.textAlignment = .center
        view.addSubview(monthLabel)
        
        /*
         TODO: 1
         完成本页其它界面
         */
        
        taskTableView = UITableView(frame: CGRect(
            x: 0, y: collectionView.frame.origin.y + collectionView.frame.height,
            width: width, height: height * 0.4 - (tabBarController?.tabBar.frame.height)!), style: .grouped)
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        taskTableView.separatorStyle = .singleLine
        view.addSubview(taskTableView)
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource, UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as UITableViewCell
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
//            myLabel.text = "hello"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2016 08 01")!
        let endDate = formatter.date(from: "2099 06 30")!
        let parameters = ConfigurationParameters(
            startDate: startDate,
            endDate: endDate,
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            hasStrictBoundaries: false
            
        )
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        cell.drawSelected()
        handleCellTextColor(view: cell, cellState: cellState)
        return cell
    }
    
    func setupCalender(from visibleDates: DateSegmentInfo) {
        
        guard let startDate = visibleDates.monthDates.first?.date else{return}
        let monthName = Calendar.current.dateComponents([.month], from: startDate)
        monthLabel.text = String(describing: monthName.month!) + "月"
        print(monthName.month!)
    }
    
    /*
     TODO: 1
     完成对点选日期的响应
     以下是可能需要的函数
     */
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        handleCellTextColor(view: myCell, cellState: cellState)
        setupCalender(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let myCell = cell as? CalendarCell else {return}
        myCell.drawSelected()
        handleCellTextColor(view: myCell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let myCell = cell as? CalendarCell else {return}
        myCell.drawSelected()
        handleCellTextColor(view: myCell, cellState: cellState)
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CalendarCell else {return}
        if cellState.isSelected {
            myCustomCell.dateLabel.textColor = .white
        } else {
            if cellState.dateBelongsTo == .thisMonth {
//                print("hello")
                myCustomCell.dateLabel.textColor = .black
            } else {
                myCustomCell.dateLabel.textColor = .gray
            }
        }
    }
    
}
