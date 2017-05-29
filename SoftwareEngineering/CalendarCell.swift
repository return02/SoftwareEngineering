//
//  CalendarCell.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     TODO: 1
     需要根据日历显示的需要来自定义样式
     */
    
    var dateLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        contentView.addSubview(dateLabel)
    }
}
