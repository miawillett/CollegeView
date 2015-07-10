//
//  College.swift
//  CollegeView
//
//  Created by mia willett on 7/7/15.
//  Copyright © 2015 mia willett. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var state = ""
    var students = 0
    var image = UIImage(named: "Default")
    var college = ""
    
    convenience init(name: String, state: String, students: Int, image: UIImage) {
        self.init()
        self.name = name
        self.state = state
        self.students = students
        self.image = image
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}