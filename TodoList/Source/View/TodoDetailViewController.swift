//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {
    @IBOutlet weak var contentTextField: UITextView!
    weak var delegate: TodoListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        guard let content = contentTextField.text else {
            return
        }
        
        delegate.setTodoList(content: content)
        
        self.navigationController?.popViewController(animated: true)
    }
}
