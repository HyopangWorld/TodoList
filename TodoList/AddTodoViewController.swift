//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by 김효원 on 10/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Feature
    // TODO: Todo 저장
    @IBAction func touchUpDoneButton(_ sender: UIBarButtonItem) {
        guard titleTextField.text != nil else {
            titleTextField.text = "텍스트를 입력하세요."
            return
        }
        
        guard contentTextField.text != nil else {
            contentTextField.text = "텍스트를 입력하세요."
            return
        }
        
        // data 저장
        
        //화면 종료
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIBarButtonItem) {
        titleTextField.text = ""
        contentTextField.text = ""
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
