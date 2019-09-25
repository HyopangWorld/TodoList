//
//  TodoList.swift
//  TodoList
//
//  Created by 김효원 on 12/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

struct Todo{
    var content: String?
    var isComplete: Bool?
    
    init(content: String, isComplete: Bool = false){
        self.content = content
        self.isComplete = isComplete
    }
}
