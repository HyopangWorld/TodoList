//
//  TodoAddControllerView.swift
//  TodoList
//
//  Created by 김효원 on 26/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class TodoAddViewController: UIViewController {
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
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancleButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
