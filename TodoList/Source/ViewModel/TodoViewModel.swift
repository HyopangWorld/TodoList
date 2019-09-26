//
//  TodoViewModel.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

protocol TodoViewModelProtocol: class {
    var isEdit: Bool { get set }
    
    // 값 변환기
    var todoDidChange: ((TodoViewModelProtocol) -> ())? { get set }
    
    // 명령
    func reloadTodo()
    func setTodo(content: String)
    func updateTodo(todo: Todo)
    func delTodo(row: Int)
}

class TodoViewModel: TodoViewModelProtocol {
    var todoList: Array<Todo> {
        didSet {
            self.todoDidChange?(self)
        }
    }
    var isEdit: Bool
    
    
    var todoDidChange: ((TodoViewModelProtocol) -> ())?
    
    init() {
        self.todoList = []
        self.isEdit = false
    }
    
    func reloadTodo(){
        if let todoList = DataService.getTodoList(key: "todoList") {
            self.todoList = todoList
        }
    }
    
    func setTodo(content: String){
        DataService.addTodo(content: content)
        self.reloadTodo()
    }
    
    func updateTodo(todo: Todo){
        DataService.updateTodo(todo: todo)
        self.reloadTodo()
    }
    
    func delTodo(row: Int){
        DataService.delTodo(id: todoList[row].id!)
        self.reloadTodo()
    }
}
