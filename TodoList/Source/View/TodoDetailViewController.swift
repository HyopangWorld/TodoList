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
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI(){
        guard let todo = todo else{
            return
        }
        
        contentTextField.text = todo.content
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let delegate = delegate, var todo = todo, let content = contentTextField.text else {
            return
        }
        
        todo.content = content
        delegate.updateTodoList(todo: todo)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
