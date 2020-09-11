//
//  CoursesListRouter.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import Foundation


protocol CoursesListRouterProtocol {
    init(viewController: ViewController)
    func openDetailsViewController(with course: Course)
}


class CoursesListRouter: CoursesListRouterProtocol{

    
    unowned let viewController: ViewController
    
    required init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    
    
    func openDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: "showDetails", sender: course)
    }
    

    
}
