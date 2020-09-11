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
    
    
      private var courses: [Course] = []
    
    
    var coursesCount: Int {
        courses.count
    }
    
    
    var imageData: Data? {
        guard let imageUrl = course?.imageUrl else {return nil}
        return interactor.fetchImageData(from: imageUrl)
    }
    
    
    var course: Course? {
        guard let selectedRow = selectedRow else {return nil}
        return getCourse(for: selectedRow)
    }
    
    
    func getCourse(for row: Int) -> Course {
        courses[row]
    }
    
    
    var selectedRow: Int?
    
    func selectedRow(at indexPath: IndexPath) {
        self.selectedRow = indexPath.row
    }
    

    func showCourses() {
        interactor.fetchCourses()
    }
    
    
}



extension CoursesListPresenter: CoursesListInteractorOutputProtocol{
    func coursesDidRecive(_ courses: [Course]) {
        self.courses = courses
        view.reloadData()
    }
}
