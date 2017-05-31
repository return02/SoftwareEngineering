//
//  RegisterViewController.swift
//  SoftwareEngineering
//
//  Created by apple on 2017/5/29.
//  Copyright © 2017年 Wang. All rights reserved.
//

import UIKit
import Foundation

class RegisterViewController: UIViewController {
    /*
     TODO: 3
     全靠你发挥
     */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    
    
    var width, height: CGFloat!
    var idTextField, passwordTextField, passwordCheckTextField: UITextField!
    var registerButton: UIButton!
    
    func initializeView()
    {
        navigationController?.navigationBar.isHidden = false
        title = "注册"
        
        
        width = view.frame.width
        height = view.frame.height
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        idTextField = UITextField(frame: CGRect(x: width * 0.2, y: height * 0.4, width: width * 0.6, height: height * 0.08))
        idTextField.placeholder = "用户名"
        idTextField.borderStyle = .roundedRect
        idTextField.returnKeyType = .done
        view.addSubview(idTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: width * 0.2, y: height * 0.5, width: width * 0.6, height: height * 0.08))
        passwordTextField.placeholder = "密码"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.returnKeyType = .done
        view.addSubview(passwordTextField)
        
        passwordCheckTextField = UITextField(frame: CGRect(x: width * 0.2, y: height * 0.6, width: width * 0.6, height: height * 0.08))
        passwordCheckTextField.placeholder = "确认密码"
        passwordCheckTextField.isSecureTextEntry = true
        passwordCheckTextField.borderStyle = .roundedRect
        passwordCheckTextField.returnKeyType = .done
        view.addSubview(passwordCheckTextField)
        
        registerButton = UIButton(frame: CGRect(x: width * 0.4, y: height * 0.7, width: width * 0.2, height: height * 0.08))
        registerButton.setTitle("注册", for: .normal)
        registerButton.setTitleColor(.blue, for: .normal)
        registerButton.setTitleColor(.gray, for: .highlighted)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registerButton)
        
    }
    
    
    func register(){
        
        let documentPath = NSHomeDirectory() + "/Documents/user"
        print(documentPath)
        var accountInfo = NSArray(contentsOfFile: documentPath) as! [NSDictionary]
        
        var wrongInfo = NSMutableArray()
        let wrongAlert:NSArray = ["用户名不能为空","密码不能为空","确认密码不能为空","用户名内仅能包含数字与字母","密码内仅能包含数字与字母","密码与确认密码不一致","该用户名已被注册"]
        if (idTextField.text?.isEmpty)!{
            wrongInfo.add(0)
        }
        if (passwordTextField.text?.isEmpty)!{
            wrongInfo.add(1)
        }
        if (passwordCheckTextField.text?.isEmpty)!{
            wrongInfo.add(2)
        }
        for char in (idTextField.text?.utf8)!{
            if (char > 64 && char < 91) || (char > 96 && char < 123) || (char > 47 && char < 58){
            }else{
                wrongInfo.add(3)
                break
            }
        }
        for char in (passwordTextField.text?.utf8)!{
            if (char > 64 && char < 91) || (char > 96 && char < 123) || (char > 47 && char < 58){
            }else{
                wrongInfo.add(4)
                break
            }
        }
        if passwordCheckTextField.text != passwordTextField.text{
            wrongInfo.add(5)
        }
        for account in accountInfo{
            if (account as! NSDictionary)["id"] as! String  == idTextField.text{
                wrongInfo.add(6)
                break
            }
        }
        
        if wrongInfo.count == 0{
            let alertView = UIAlertView(title: "警告", message: "注册成功", delegate: self, cancelButtonTitle: "确定")
            alertView.show()
            accountInfo.append(["user": accountInfo.count, "id": idTextField.text!,"password": passwordTextField.text!])
            (accountInfo as NSArray).write(toFile: documentPath, atomically: true)
            
            
        }else{
            var alertInfo = ""
            for i in wrongInfo{
                alertInfo += wrongAlert[i as! Int] as! String
                alertInfo += "\n"
            }
            
            
            let alertView = UIAlertView(title: "警告", message: alertInfo, delegate: self, cancelButtonTitle: "   确定")
            alertView.show()
        }
    }
}
