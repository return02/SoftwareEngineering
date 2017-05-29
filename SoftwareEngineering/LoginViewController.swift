//
//  ViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/28.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
        initializeView()
    }
    
    func initializeData() {
        let documentPath = NSHomeDirectory() + "/Documents"
        if FileManager.default.fileExists(atPath: documentPath + "/user") {
            return
        }
        var user = [NSDictionary]()
        user.append(["user": 0, "id": "zty", "password": ""])
        (user as NSArray).write(toFile: documentPath + "/user", atomically: true)
        var task = [NSDictionary]()
        task.append(["task": 0, "user": 0, "startDate": "2017 05 28", "endDate": "2017 06 04", "title": "lab4", "importance": 3])
        (task as NSArray).write(toFile: documentPath + "/task", atomically: true)
        var friend = [[Int]]()
        friend.append([])
        (friend as NSArray).write(toFile: documentPath + "/friend", atomically: true)
    }
    
    var width, height: CGFloat!
    var idTextField, passwordTextField: UITextField!
    var registerButton, loginButton: UIButton!
    func initializeView() {
        width = view.frame.width
        height = view.frame.height
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        idTextField = UITextField(frame: CGRect(x: width * 0.2, y: height * 0.5, width: width * 0.6, height: height * 0.08))
        idTextField.placeholder = "用户名"
        idTextField.borderStyle = .roundedRect
        idTextField.returnKeyType = .done
        idTextField.delegate = self
        view.addSubview(idTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: width * 0.2, y: height * 0.6, width: width * 0.6, height: height * 0.08))
        passwordTextField.placeholder = "密码"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
        view.addSubview(passwordTextField)
        
        registerButton = UIButton(frame: CGRect(x: width * 0.4, y: height * 0.7, width: width * 0.2, height: height * 0.08))
        registerButton.setTitle("注册", for: .normal)
        registerButton.setTitleColor(.blue, for: .normal)
        registerButton.setTitleColor(.gray, for: .highlighted)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registerButton)
        
        loginButton = UIButton(frame: CGRect(x: width * 0.4, y: height * 0.8, width: width * 0.2, height: height * 0.08))
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.setTitleColor(.gray, for: .highlighted)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginButton)
        
        /*
         TODO: 5
         完成本页其它界面
         */
    }
    
    func register() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func login() {
        /*
         TODO: 5
         验证用户名密码并存储用户登录信息
         */
        
        navigationController?.pushViewController(TabBarController(), animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
