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
        
        viewModel = TodoViewModel()
    }
    
    
    // MARK: - Move View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "detail":
            guard let row = (sender as? Int) else {
                return
            }
            
            let detailVC = segue.destination as! TodoDetailViewController
            detailVC.todo = viewModel?.todoList[row]
            detailVC.delegate = self
            
        case "add":
            let addVC = segue.destination as! TodoAddViewController
            addVC.delegate = self
            
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
        
        if let title = cell.viewWithTag(1) {
            if  title is UILabel {
                (title as! UILabel).text = todoList[row].content ?? ""
            }
        }
        
        if let checkMark = cell.viewWithTag(2) {
            if  checkMark is UILabel {
                let value = todoList[row].isComplete ?? false ? 1 : 0
                (checkMark as! UILabel).text = TodoComplete(rawValue: value)?.getIcon()
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detail", sender: indexPath.row)
    }
    
    // MARK: - cell 삭제
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "삭제") { (delete, indexPath) in
            self.viewModel?.delTodo(row: indexPath.row)
        }
        
        return [delete]
    }
}

extension TodoListViewController: TodoListDelegate {
    func setTodoList(content: String) {
        viewModel?.setTodo(content: content)
    }
    
    func updateTodoList(todo: Todo) {
        viewModel?.updateTodo(todo: todo)
    }
}
