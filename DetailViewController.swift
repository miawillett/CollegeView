//
//  DetailViewController.swift
//  CollegeView
//
//  Created by mia willett on 7/7/15.
//  Copyright © 2015 mia willett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var studentsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    var webURL = NSURL(string: "")
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text! = college.name
        stateTextField.text! = college.state
        studentsTextField.text! = String(college.students)
        imageView.image = college.image!
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func onSaveButtonTapped(sender: UIButton) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.students = Int (studentsTextField.text!)!
    }
    @IBAction func displayWebsiteTapped(sender: AnyObject) {
        
        if collegeTextField.text == "Northwestern University"{
            webURL = NSURL(string: "http://www.northwestern.edu/")
        }
        else if collegeTextField.text == "Harvard University"{
            webURL = NSURL(string: "http://www.harvard.edu/")
        }
        else if collegeTextField.text == "Stanford University"{
            webURL = NSURL(string: "https://www.stanford.edu/")
        }
        else{
            print("google")
            webURL = NSURL(string: "http://google.com")
        }
        UIApplication.sharedApplication().openURL(webURL!)
        
    }
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        
        let actionSheet = UIAlertController(title: "camera", message: "camera or photo library", preferredStyle: .ActionSheet)
        let cameraAction = UIAlertAction(title: "camera", style: .Default) { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            }
        }
        let libraryAction = UIAlertAction(title: "Library", style: .Default) { (action) -> Void in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { () -> Void in
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imageView.image = image
                
            }
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mvc = segue.destinationViewController as! MapViewController
        let location = college.name + "," + college.state
        
        //mvc!.collegeTextField.text! = college.name
        //mvc!.stateTextField.text! = college.state
        //mvc!.studentsTextField.text! = String(college.students)}
        //var placemark = ""
    }
}