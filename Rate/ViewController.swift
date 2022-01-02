//
//  ViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 02.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        var labelName: UILabel = {
           var label = UILabel()
            label.text = "Hello Kirill"
            label.textColor = .blue
    
            return label
        }()
        
        view.addSubview(labelName)
        labelName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }


}

