//
//  DetailViewController.swift
//  CollegeView
//
//  Created by mia willett on 7/7/15.
//  Copyright © 2015 mia willett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var studentsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.state
        studentsTextField.text = String(college.students)
        imageView.image = college.image
    }
    @IBAction func onSaveButtonTapped(sender: UIButton) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.students = Int (studentsTextField.text!)!
    }
    
    
}
