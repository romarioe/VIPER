//
//  ViewController.swift
//  VIPER
//
//  Created by Roman Efimov on 11.09.2020.
//  Copyright © 2020 Roman Efimov. All rights reserved.
//

import UIKit



protocol CoursesListViewInputProtocol: class {
   func reloadData()
}


protocol CoursesListViewOutputProtocol: class {
     var coursesCount: Int {get}
     func showCourses()
     func selectedRow(at indexPath: IndexPath)
     var  course: Course? { get }
     var imageData: Data? { get }
}


class ViewController: UIViewController {
    
    var presenter: CoursesListViewOutputProtocol!
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurator.configure(with: self)
        presenter.showCourses()
    
    }


}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       presenter.coursesCount
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        presenter.selectedRow(at: indexPath)
        cell.textLabel?.text = presenter.course?.name
        let imageData = presenter.imageData
        cell.imageView?.image = UIImage(data: imageData!)
        return cell
    }
    
    
    
    
}



extension ViewController: UITableViewDelegate {
    
}



extension ViewController: CoursesListViewInputProtocol{
    func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

