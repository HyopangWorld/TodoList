//
//  TodoListDelegate.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

protocol TodoListDelegate: AnyObject{
    func setTodoList(content: String)
}
