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
    private static var id = 0
    
    static func getTodoList() -> Dictionary<String, Dictionary<String, Any>> {
        return self.todoList
    }
    
    static func setTodoList(_ todoList: Dictionary<String, Dictionary<String, Any>>){
        self.todoList = todoList
    }
    
    static func getId() -> Int{
        return self.id
    }
    
    static func setId(_ id: Int){
        self.id = id
    }
    
    
    // MARK: - 데이터 저장
    static func saveData(){
        UserDefaults.standard.set(todoList, forKey: "todoList")
    }
    
    
    // MARK: - 데이터 불러오기
    static func getData(){
        if let todoList = UserDefaults.standard.dictionary(forKey: "todoList"){
            if  todoList is [String : Dictionary<String, Any>] {
                self.todoList = todoList as! [String : Dictionary<String, Any>]
            }
        }
    }
    
}
