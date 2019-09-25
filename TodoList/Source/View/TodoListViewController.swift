//
//  TodoListViewController.swift
//  TodoList
//
//  Created by 김효원 on 25/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var viewModel: TodoViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            viewModel.todoDidChange = { [unowned self] viewModel in
               self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Move View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case "AddTodo":
            break
            
        case "DetailTodo":
            let detailVC = segue.destination as! TodoDetailViewController
            detailVC.delegate = self
            
        default: break
        }
    }
    
    
    // MARK: - Edit Todo List
    @IBAction func editButtonDidTap(_ sender: Any) {
        
    }
    
}


extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.todoList.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListItem", for: indexPath)
        guard let todoList = viewModel?.todoList else {
            return cell
        }
        let row = indexPath.row
        
        if let checkMark = cell.viewWithTag(0) {
            checkMark.isHidden = todoList[row].isComplete ?? false
        }
        
        if let title = cell.viewWithTag(1) {
            if  title is UILabel {
                (title as! UILabel).text = todoList[row].content ?? ""
            }
        }
        
        return cell
    }
    
}

extension TodoListViewController: TodoListDelegate {
    func updateTodoList(content: String) {
        viewModel?.reloadTodo()
    }
}
