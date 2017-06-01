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
    
    var dscTextField : UITextField!
    var startDatePicker, endDatePicker : UIDatePicker!
    var startDateLabel, endDateLabel, importanceLabel : UILabel!
    var importancePicker : UIPickerView!
    var width, height: CGFloat!
    var registerButton: UIButton!
    let formatter = DateFormatter()
    
    public var lastUpdatedItem : NSDictionary!
    
    func initializeView() {
        view.backgroundColor = .white
        
        /*
         TODO: 2
         已基本完成本页其它界面
         */
        width = view.frame.width
        height = view.frame.height

        // Text field for task title
        dscTextField = UITextField(frame : CGRect(x: -width * 0.02, y: height * 0.2, width: width * 1.03, height: height * 0.08))
        dscTextField.placeholder = " 任务描述"
        dscTextField.returnKeyType = .done
        dscTextField.delegate = self
        dscTextField.layer.borderColor = UIColor.lightGray.cgColor
        dscTextField.layer.borderWidth = 1
        dscTextField.text = "  "
        dscTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        view.addSubview(dscTextField)
        
        // Starting date label and picker
        startDateLabel = UILabel(frame: CGRect(x: 0, y: height * 0.36, width: width * 0.31, height: height * 0.08))
        startDateLabel.text = " 开始日期"
        view.addSubview(startDateLabel)
        
        startDatePicker = UIDatePicker(frame : CGRect(x: width * 0.3, y: height * 0.32, width: width * 0.73, height: height * 0.08 * 2))
        startDatePicker.datePickerMode = .date
        startDatePicker.locale = Locale(identifier: "zh_CN")
        startDatePicker.addTarget(self, action: #selector(dateChanged),
                                  for: .valueChanged)
        view.addSubview(startDatePicker)
        
        // Ending date label and picker
        endDateLabel = UILabel(frame: CGRect(x: 0, y: height * 0.52, width: width * 0.31, height: height * 0.08))
        endDateLabel.text = " 结束日期"
        view.addSubview(endDateLabel)
        
        endDatePicker = UIDatePicker(frame : CGRect(x: width * 0.3, y: height * 0.48, width: width * 0.73, height: height * 0.08 * 2))
        endDatePicker.datePickerMode = .date
        endDatePicker.locale = Locale(identifier: "zh_CN")
        endDatePicker.addTarget(self, action: #selector(dateChanged),
                                  for: .valueChanged)
        view.addSubview(endDatePicker)
        
        // Importance label and picker
        importanceLabel = UILabel(frame: CGRect(x: 0, y: height * 0.68, width: width * 0.31, height: height * 0.08))
        importanceLabel.text = "  重要性"
        view.addSubview(importanceLabel)
        
        importancePicker = UIPickerView(frame: CGRect(x: width * 0.3, y: height * 0.64, width: width * 0.73, height: height * 0.08 * 2))
        importancePicker.dataSource = self
        importancePicker.delegate = self
        
        importancePicker.selectRow(2, inComponent: 0, animated: false)
        view.addSubview(importancePicker)
        
        // Register Button
        registerButton = UIButton(frame: CGRect(x: width * 0.35, y: height * 0.84, width: width * 0.3, height: height * 0.08))
        registerButton.setTitle("完成", for:.normal)
        registerButton.setTitleColor(UIColor.red, for:.normal)
        registerButton.backgroundColor = UIColor.white
        registerButton.addTarget(self, action:#selector(done), for:.touchUpInside)
        view.addSubview(registerButton)
       
        //TODO: use calculated location of UI elements
    }
    
    // Date Picker void callback
    func dateChanged(datePicker : UIDatePicker){
        return
    }
    
    // Format data to be written
    func readDate(datePicker : UIDatePicker) -> String{
        formatter.dateFormat = "yyyy MM dd"
        return formatter.string(from: datePicker.date)
    }
    
    // Called when press “完成” button
    func done() {
        // Read from record file, append one more and write back
        let documentPath = NSHomeDirectory() + "/Documents"
        let tasks = NSArray(contentsOfFile: documentPath + "/task")!
        var mutable:[NSDictionary] = tasks as! [NSDictionary]
        
        // The new item defined in this view
        let newItem : NSDictionary = [ "title": dscTextField.text ?? "未命名任务", "importance": importancePicker.selectedRow(inComponent: 0) + 1, "startDate": readDate(datePicker: startDatePicker), "endDate": readDate(datePicker: endDatePicker), "task":0, "user":0]
        mutable.append(newItem)
        lastUpdatedItem = newItem
        
        // write back
        let updatedTasks : NSArray = NSArray(array: mutable)
        updatedTasks.write(toFile: documentPath + "/task", atomically: true)
        /*
         TODO: 2
         已处理任务添加和修改
         */
        
        
        navigationController?.popViewController(animated: true)
        
        //TODO: IMPORTANT! refresh task view!
        //TODO: specify task and user ID
        
    }
    
    func getLastUpdateItem() -> NSDictionary {
        return lastUpdatedItem
    }
}

extension ModifyViewController: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // Some delegate implementation
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Only one column in importancePicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Five level in importancePicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5;
    }
    
    // Form level in importancePicker [1, 2, 3, 4, 5]
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 1)
    }

}
