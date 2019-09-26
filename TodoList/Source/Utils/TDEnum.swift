//
//  TDEnum.swift
//  TodoList
//
//  Created by 김효원 on 26/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import Foundation

enum TodoComplete: Int {
    case yet = 0
    case complete = 1
    
    func getIcon() -> String {
        switch self {
        case .yet:
            return "☹︎"
        case .complete:
            return "☻"
        }
    }
}
