//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

protocol TodoViewModelProtocol: class {
    // 값 변환기
    var todoDidChange: ((TodoViewModelProtocol) -> ())? { get set }
    
    // 명령
    func reloadTodo()
    func setTodo(content: String)
}

class TodoViewModel: TodoViewModelProtocol {
    var todoList: Array<Todo> {
        didSet {
            self.todoDidChange?(self)
        }
    }
    
    var todoDidChange: ((TodoViewModelProtocol) -> ())?
    
    init() {
        self.todoList = []
    }
    
    func setTodo(content: String){
        DataService.setTodo(content: content)
        
        self.reloadTodo()
    }
    
    func reloadTodo(){
        if let todoList = DataService.getTodoList(key: "todoList") {
            self.todoList = todoList
        }
    }
}
