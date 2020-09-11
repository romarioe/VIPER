//
//  CoursesListPresenter.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import Foundation


class CoursesListPresenter: CoursesListViewOutputProtocol{
    
    unowned let view: CoursesListViewInputProtocol!
    var interactor: CoursesListInteractorInputProtocol!
    var router: CoursesListRouterProtocol!
    
    
    required init(view: CoursesListViewInputProtocol) {
        self.view = view
    }
    
}



extension CoursesListPresenter: CoursesListInteractorOutputProtocol{
    
}
