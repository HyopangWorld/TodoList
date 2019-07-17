//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by 김효원 on 10/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        super.viewDidLoad()
    }
    
    // MARK: - 기능
    // MARK: Todo 저장
    @IBAction func touchUpDoneButton(_ sender: UIBarButtonItem) {
        if alert == nil{
            alert = UIAlertController(title: "알림", message: "제목을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
        }
        
        let title: String
        if titleTextField.text != nil && titleTextField.text != ""{
            title = titleTextField.text!
        } else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        var content = ""
        if contentTextView.text != nil {
            content = contentTextView.text
        }
        
        list.append(TodoList(title: title, content: content, isComplete: false))
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: cancle
    @IBAction func touchUpCancelButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
