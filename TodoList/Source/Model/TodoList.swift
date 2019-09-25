//
//  TodoList.swift
//  TodoList
//
//  Created by 김효원 on 12/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

struct TodoList{
    var title: String = ""
    var content: String = ""
    var isComplete: Bool = false
    
    init(title: String, content: String, isComplete: Bool = false){
        self.title = title
        self.content = content
        self.isComplete = isComplete
    }
}
