//
//  CoursesListIterator.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import Foundation

protocol CoursesListInteractorInputProtocol: class {
    init(presenter: CoursesListInteractorOutputProtocol)
    
}

protocol CoursesListInteractorOutputProtocol: class {
    
}

class CoursesListInteractor: CoursesListInteractorInputProtocol {
    
    unowned let presenter: CoursesListInteractorOutputProtocol
    
    required init(presenter: CoursesListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    
}


