//
//  TodoServise.swift
//  TodoList
//
//  Created by 김효원 on 27/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

protocol TodoServiceProtocol {
    func getTodoList(key: String) -> Array<Todo>?
    func addTodo(content: String)
    func updateTodo(todo: Todo)
    func delTodo(id: String)
}

class TodoService: NSObject, TodoServiceProtocol {

    // MARK: - todo List 불러오기
    func getTodoList(key: String) -> Array<Todo>? {
        var todoArray = Array<Todo>()
        
        for data in DataService.getTodoList() {
            var todoData = data.value
            var todo = Todo()
            todo.id = data.key
            todo.content = todoData["content"] as? String
            todo.isComplete = todoData["isComplete"] as? Bool
            
            todoArray.append(todo)
        }
        
        // 배열 정렬
        todoArray = todoArray.sorted(by: { ($0.id! as NSString).integerValue < ($1.id! as NSString).integerValue })
        
        return todoArray
    }
    
    
    // MARK: - todo 추가
    func addTodo(content: String) {
        let todoDictionary = [
            "content" : content,
            "isComplete" : false
            ] as [String : Any]
        
        var id = DataService.getId()
        id += 1
        
        DataService.setId(id)
        
        var todoList = DataService.getTodoList()
        todoList.updateValue(todoDictionary, forKey: "\(id)")
        
        DataService.setTodoList(todoList)
    }
    
    
    // MARK: - todo 업데이트
    func updateTodo(todo: Todo){
        let todoDictionary = [
            "content" : todo.content ?? "",
            "isComplete" : todo.isComplete ?? false
            ] as [String : Any]
        
        var todoList = DataService.getTodoList()
        todoList.updateValue(todoDictionary, forKey: todo.id!)
        
        DataService.setTodoList(todoList)
    }
    
    
    // MARK: - todo 삭제
    func delTodo(id: String){
        var todoList = DataService.getTodoList()
        todoList.removeValue(forKey: id)
        
        DataService.setTodoList(todoList)
    }
}
