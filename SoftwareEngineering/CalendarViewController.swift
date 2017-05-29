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
    var monthLabel: UILabel!
    func initializeView() {
        width = view.frame.width
        height = view.frame.height
        
        view.backgroundColor = .white
        
        collectionView = JTAppleCalendarView(frame: CGRect(x: 0, y: height * 0.1, width: width, height: height * 0.5))
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
        
        monthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height * 0.1))
        monthLabel.text = "六月"
        monthLabel.textAlignment = .center
        view.addSubview(monthLabel)
        
        /*
         TODO: 1
         完成本页其它界面
         */
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2017 06 01")!
        let endDate = formatter.date(from: "2017 06 30")!
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        return cell
    }
    
    /*
     TODO: 1
     完成对点选日期的响应
     以下是可能需要的函数
     */
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
    }
}
