//
//  AddCatTableViewCell.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 10/4/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

var name = ""
var type = ""
var age = -1


class AddCatTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    @IBOutlet weak var AddCatTextView: UITextView!
    @IBOutlet weak var AddCatPickerView: UIPickerView!
    var addCatViewController:AddCatViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddCatPickerView.delegate = self
        AddCatPickerView.dataSource = self
        AddCatTextView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Method for PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        age = row
        if(age != 1)
        {
            AddCatTextView.text = "Age " + String(age)
        } else {
            AddCatTextView.text = " "
        }
        
        // then we want to reload this section
        // AddCatPickerView.selectRow(0, inComponent: 0, animated: false)
        AddCatTextView.text = "Age " + String(age)
        checkDoneEnable()
    }
    
    // MARK: - Method for TextView
    func textViewDidChange(_ textView: UITextView) {
        if(AddCatTextView.tag == 0) {
            name = AddCatTextView.text
        } else if (AddCatTextView.tag == 1) {
            type = AddCatTextView.text
        }
        checkDoneEnable()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        AddCatTextView.textColor = UIColor.black
        AddCatTextView.text = ""
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if (AddCatTextView.text == "") {
            if(AddCatTextView.tag == 0) {
                AddCatTextView.text = "Name"
                name = ""
            } else if (AddCatTextView.tag == 1) {
                AddCatTextView.text = "Type"
                type = ""
            }
            AddCatTextView.textColor = UIColor.gray
        }
    }
    
    func checkDoneEnable() {
        if ((addCatViewController?.canSubmit())!) {
            addCatViewController?.DoneButton.isEnabled = true
        } else {
            addCatViewController?.DoneButton.isEnabled = false
        }
    }
}
