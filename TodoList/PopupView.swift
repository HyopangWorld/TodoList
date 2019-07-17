//
//  PopupView.swift
//  TodoList
//
//  Created by 김효원 on 12/07/2019.
//  Copyright © 2019 HyowonKim. All rights reserved.
//

import UIKit

class PopupView: UIView{
    private let xibName = "PopupView"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        self.addSubview(view)
    }
}
