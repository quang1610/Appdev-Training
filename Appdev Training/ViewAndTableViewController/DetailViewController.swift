//
//  DetailViewController.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 9/28/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var segueName:String = ""
    var segueAge:String = ""
    var segueType: String = ""
    var segueImage:UIImage!

    @IBOutlet weak var CatImage: UIImageView!
    @IBOutlet weak var CatName: UILabel!
    @IBOutlet weak var CatAge: UILabel!
    @IBOutlet weak var CatType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CatName.text = segueName
        CatImage.image = segueImage
        CatAge.text = segueAge + " year-old"
        CatType.text = segueType
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
