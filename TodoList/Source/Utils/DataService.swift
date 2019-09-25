//
//  DataService.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

class DataService {
    
    static func getTodoList(key: String) -> Array<Todo>? {
        return UserDefaults.standard.array(forKey: key) as? Array<Todo>
    }
    
    static func setTodo(key: String, todo: String) {
        UserDefaults.standard.setValue(todo, forKeyPath: key)
    }
    
    static func delTodo(key: String){
        UserDefaults.standard.removeObject(forKey: key)
    }
}
