//
//  CoursesListConfigurator.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorProtocol {
    func configure(with viewController: ViewController)
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    func configure(with viewController: ViewController) {
        let presenter = CoursesListPresenter(view: viewController)
        let interactor = CoursesListInteractor(presenter: presenter)
        let router = CoursesListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

