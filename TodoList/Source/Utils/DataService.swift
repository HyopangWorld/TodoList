//
//  DataService.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

class DataService {
    private static var todoList = Dictionary<String, Dictionary<String, Any>>()
    
    static func getTodoList(key: String) -> Array<Todo>? {
        var todoArray = Array<Todo>()
        
        for data in todoList {
            var todoData = data.value
            var todo = Todo()
            todo.id = data.key
            todo.content = todoData["content"] as? String
            todo.isComplete = todoData["isComplete"] as? Bool
            
            todoArray.append(todo)
        }
        
        return todoArray
    }
    
    static func setTodo(content: String) {
        var todo = Todo()
        todo.id = "\(todoList.count+1)"
        todo.content = content
        todo.isComplete = false
        
        let todoDictionary = [
            "content" : todo.content!,
            "isComplete" : todo.isComplete!
            ] as [String : Any]
        
        todoList.updateValue(todoDictionary, forKey: todo.id!)
    }
    
    static func delTodo(id: String){
        todoList.removeValue(forKey: id)
    }
}
