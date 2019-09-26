//
//  TotoTableViewCell.swift
//  TodoList
//
//  Created by 김효원 on 26/09/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    @IBOutlet weak var checkMark: UIButton!
    @IBOutlet weak var titleTextField: UILabel!
    
    var delegate: TodoCellDelgate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextField.text = nil
    }
    
    @IBAction func checkMarkDidTap(_ sender: UIButton) {
        guard let delegate = delegate else {
            return
        }
        
        sender.isSelected = !sender.isSelected
        delegate.checkMarkDidTap(tag: sender.tag, isComplete: sender.isSelected)
    }
}
