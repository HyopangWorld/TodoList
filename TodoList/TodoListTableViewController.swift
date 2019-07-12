//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by 김효원 on 10/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

var list = [TodoList]()
class TodoListTableViewController: UITableViewController{
    
    @IBOutlet var todoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        todoListTableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // MARK: - 기능
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // MARK: TodoList 조회
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].content
        if list[indexPath.row].isComplete {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        todoListTableView.reloadData()
    }
    
    // MARK: TodoList 편집
    @IBAction func editButtonAction(_ sender: Any) {
        //리스트 비어있을 때 return
        guard !list.isEmpty else {
            return
        }
        
        todoListTableView.setEditing(true, animated: true) //editmode animaition
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:  #selector(doneButtonTap))
        doneButton.style = .plain
        doneButton.target = self
        self.navigationItem.leftBarButtonItem = doneButton
    }
    
    @objc func doneButtonTap(){
        self.navigationItem.leftBarButtonItem = editButtonItem
        todoListTableView.setEditing(false, animated: true)
    }
    
}
