//
//  AddCatViewController.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 10/4/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

extension UIViewController {
    
}

class AddCatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var isPickerViewIsOpened = false
    let addCatTextViewFontSize = 20
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    @IBOutlet weak var AddCatTableView: UITableView!
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
        if(DoneButton.isEnabled) {
            print("Enable")
        }
        Cat.addCat(name: name, age: age, image: #imageLiteral(resourceName: "cu2x6Z7"), type: type)
        age = -1
        name = ""
        type = ""
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ClearButtonTapped(_ sender: Any) {
        age = -1
        name = ""
        type = ""
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddCatTableView.delegate = self
        AddCatTableView.dataSource = self
        DoneButton.isEnabled = false
        
        dismissKeyboard()
        
        // Do any additional setup after loading the view.
    }
    
    func canSubmit() -> Bool {
        print ("name: " + name + "type: " + type)
        return name != "" && type != "" && age != -1
    }
    
    // MARK: - TableView method
    func numberOfSections(in tableView: UITableView) -> Int {
        // one section for name and type
        // one for age and image
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if(section == 0) {
//            return 2
//        } else {
//            if(isPickerViewIsOpened) {
//                return 2
//            } else {
//                return 1
//            }
//        }
        if (section == 0) {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCatCell", for: indexPath) as! AddCatTableViewCell
        cell.AddCatTextView.textContainer.maximumNumberOfLines = 1
        cell.AddCatTextView.textContainer.lineBreakMode = .byTruncatingTail
        cell.AddCatPickerView.isHidden = true
        cell.AddCatTextView.tag = indexPath.row + indexPath.section * 10
        if (indexPath.section == 0) {
            cell.AddCatTextView.font = .systemFont(ofSize: CGFloat(addCatTextViewFontSize))
            cell.AddCatTextView.isEditable = true
            cell.AddCatTextView.textColor = UIColor.gray
            cell.AddCatTextView.isScrollEnabled = false
            if (indexPath.row == 0) {
                cell.AddCatTextView.text = "Name"
            } else if (indexPath.row == 1) {
                cell.AddCatTextView.text = "Type"
            }
        } else {
            if (indexPath.row == 0) {
//                cell.AddCatTextView.font = .systemFont(ofSize: CGFloat(addCatTextViewFontSize))
//                cell.AddCatTextView.isEditable = false
//                cell.AddCatTextView.isSelectable = false
//                cell.AddCatTextView.isUserInteractionEnabled = false
//                cell.AddCatTextView.textColor = UIColor.black
//                if (age == -1) {
//                    cell.AddCatTextView.text = "Age"
//                } else {
//                    cell.AddCatTextView.text = "Age " + String(age)
//                }
//
//            } else {
//                cell.AddCatTextView.isHidden = true
//                cell.AddCatPickerView.isHidden = false
//                cell.AddCatPickerView.selectRow(0, inComponent: 0, animated: false)
//            }
                cell.AddCatTextView.isHidden = false
                cell.AddCatTextView.isEditable = false
                cell.AddCatTextView.isSelectable = false
                cell.AddCatTextView.isUserInteractionEnabled = false
                cell.AddCatTextView.font = .systemFont(ofSize: CGFloat(addCatTextViewFontSize))
                cell.AddCatTextView.textColor = UIColor.black
                if (age == -1) {
                    cell.AddCatTextView.text = "Age"
                } else {
                    cell.AddCatTextView.text = "Age " + String(age)
                }
                if (isPickerViewIsOpened) {
                    cell.AddCatPickerView.isHidden = false
                    if (age >= 0) {
                        cell.AddCatPickerView.selectRow(age, inComponent: 0, animated: false)
                    } else {
                        cell.AddCatPickerView.selectRow(0, inComponent: 0, animated: false)
                    }
                } else {
                    cell.AddCatPickerView.isHidden = true
                }
            }
        }
        cell.addCatViewController = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1 && indexPath.row == 0) {
            print("I select this")
            isPickerViewIsOpened = !isPickerViewIsOpened
        }
        tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 50
        } else {
            if (isPickerViewIsOpened) {
                return 300
            } else {
                return 50
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
