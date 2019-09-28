//
//  ViewController.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 9/25/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // instance variable
    private var submitMode:Bool = true
    // UI variables
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var ClassTextField: UITextField!
    @IBOutlet weak var DisplayLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ClassLabel: UILabel!
    @IBOutlet weak var SubmitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.object(forKey: "name") != nil && UserDefaults.standard.object(forKey: "classYear") != nil) {
            enterClearMode()
            DisplayLabel.text = UserDefaults.standard.string(forKey: "name")! + " " + UserDefaults.standard.string(forKey: "classYear")!
        } else {
            enterSubmitMode()
        }
        Cat.addCat(name: "Cutie", age: 2, image: #imageLiteral(resourceName: "cu2x6Z7"), type: "smoll")
        Cat.addCat(name: "Leon", age: 1, image: #imageLiteral(resourceName: "d81ff3fa3dfd62402dbb2f34668ebf6516623fde_00"), type: "Smoller")
    }
    
    func enterClearMode() {
        NameLabel.isHidden = true
        ClassLabel.isHidden = true
        NameTextField.isHidden = true
        ClassTextField.isHidden = true
        // make DisplayLabel visible
        DisplayLabel.isHidden = false
        
        // update Submit button
        SubmitButton.setTitle("Clear", for: .normal)
        
        self.submitMode = false
    }
    
    func enterSubmitMode() {
        NameLabel.isHidden = false
        ClassLabel.isHidden = false
        NameTextField.isHidden = false
        ClassTextField.isHidden = false
        DisplayLabel.isHidden = true
        
        // update Submit button
        SubmitButton.setTitle("Submit", for: .normal)
        
        self.submitMode = true
    }
    
    @IBAction func SubmitButtonTapped(_ sender: Any) {
        if (!submitMode) {
            enterSubmitMode()
            
            // clear user default
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "classYear")
            
        } else {
            // we trim the white space and new line in the beginning and the end of name and classYear
            var name = NameTextField.text ?? ""
            name = name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            
            var classYear = ClassTextField.text ?? ""
            classYear = classYear.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            DisplayLabel.text = name + " " + classYear
            
            // Setup User Default
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(classYear, forKey: "classYear")
            
            // update TextField
            NameTextField.text = ""
            ClassTextField.text = ""
            
            enterClearMode()
        }
    }
    
    
}

