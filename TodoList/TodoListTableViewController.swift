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
        loadAllData()
        super.viewDidLoad()
        
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        saveAllData()
        todoListTableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // MARK: - 기능
    // MARK: TodoList UserData 저장
    func saveAllData(){
        let data = list.map{
            [
                "title" : $0.title,
                "content" : $0.content,
                "isComplete" : $0.isComplete
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "items")
        userDefaults.synchronize()
    }
    
    // MARK: TodoList UserData 조회
    func loadAllData(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
            return
        }
        
        print(data.description)
        
        list = data.map {
            let title = $0["title"] as? String
            let content = $0["content"] as? String
            let isComplete = $0["isComplete"] as? Bool
            
            return TodoList(title: title ?? "", content: content!, isComplete: isComplete ?? false)
        }
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        saveAllData()
        todoListTableView.reloadData()
    }
    
}
