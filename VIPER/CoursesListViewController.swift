//
//  ViewController.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import UIKit



protocol CoursesListViewInputProtocol: class {
    
}


protocol CoursesListViewOutputProtocol: class {
    
}


class ViewController: UIViewController {
    
    var presenter: CoursesListViewOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



extension ViewController: CoursesListViewInputProtocol{
    
    
}

