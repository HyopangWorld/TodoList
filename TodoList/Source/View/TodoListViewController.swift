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
        
        setUI()
    }
    
    func setUI(){
        viewModel = TodoViewModel()
        viewModel?.reloadTodo()
        
        tableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: "TodoItem")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "detail":
            guard let todo = (sender as? Todo) else {
                return
            }
            
            let detailVC = segue.destination as! TodoDetailViewController
            detailVC.todo = todo
            detailVC.delegate = self
            
        case "add":
            let addVC = segue.destination as! TodoAddViewController
            addVC.delegate = self
            
        default: break
            
        }
    }
}


extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.todoList.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath) as! TodoTableViewCell
        
        guard let todoList = viewModel?.todoList else {
            return cell
        }
        let row = indexPath.row
        
        cell.delegate = self
        
        cell.titleTextField.text = todoList[row].content ?? ""
        cell.checkMark.tag = row
        cell.checkMark.isSelected = todoList[row].isComplete ?? false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detail", sender: viewModel?.todoList[indexPath.row])
    }
    
    
    // MARK: - todo 삭제
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "삭제") { (delete, indexPath) in
            self.viewModel?.delTodo(row: indexPath.row)
        }
        
        return [delete]
    }
}


extension TodoListViewController: TodoCellDelgate {
    
    // MARK: - todo 완료 상태 변경
    func checkMarkDidTap(tag: Int, isComplete: Bool) {
        viewModel?.completeTodo(row: tag, isComplete: isComplete)
    }
}


extension TodoListViewController: TodoListDelegate {
    
    // MARK: - todo 추가
    func setTodoList(content: String) {
        viewModel?.addTodo(content: content)
    }
    
    // MARK: - todo 업데이트
    func updateTodoList(todo: Todo) {
        viewModel?.updateTodo(todo: todo)
    }
}
