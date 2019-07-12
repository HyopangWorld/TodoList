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
    
    override func viewDidLoad() {
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        super.viewDidLoad()
    }
    
    // MARK: - 기능
    // MARK: Todo 저장
    @IBAction func touchUpDoneButton(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text else {
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
