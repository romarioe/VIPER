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
    func fetchCourses()
    func fetchImageData(from string: String) -> Data
    
}

protocol CoursesListInteractorOutputProtocol: class {
    func coursesDidRecive(_ courses: [Course])
}

class CoursesListInteractor: CoursesListInteractorInputProtocol {
 
    
    func fetchImageData(from string: String) -> Data {
        return ImageManager.shared.getImageData(from: string)!
    }
    
    
    unowned let presenter: CoursesListInteractorOutputProtocol
    
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { (courses) in
            self.presenter.coursesDidRecive(courses)
            print (courses)
        }
    }
    
    
    
    
    required init(presenter: CoursesListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    
}


