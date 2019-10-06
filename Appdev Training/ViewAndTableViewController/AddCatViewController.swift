//
//  AddCatViewController.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 10/4/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {

    @IBOutlet weak var AddCatTableView: UITableView!
    @IBAction func DoneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func ClearButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
