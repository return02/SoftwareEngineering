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
    var context: CGContext?
    var size: CGRect?
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
        let minLen = min(frame.width, frame.height) - 10
        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: minLen, height: minLen))
        dateLabel.layer.cornerRadius = minLen / 2
//        dateLabel alignment
        dateLabel.frame.origin.x = bounds.origin.x + (bounds.size.width - minLen) / 2.0
        dateLabel.frame.origin.y = bounds.origin.y + (bounds.size.height - minLen) / 2.0
        dateLabel.clipsToBounds = true
        dateLabel.textAlignment = .center
        contentView.addSubview(dateLabel)
        size = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
    }

//    let bgColor = UIColor.red
    override func draw(_ rect: CGRect) {
        context = UIGraphicsGetCurrentContext()
        context?.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context?.addRect(size!)
        context?.fillPath()
    }
    
    func drawSelected() {
        if self.isSelected {
            dateLabel.backgroundColor = .red
        } else {
            dateLabel.backgroundColor = .white
        }
    }
}
