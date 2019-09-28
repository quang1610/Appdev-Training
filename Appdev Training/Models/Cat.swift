//
//  Cat.swift
//  Appdev Training
//
//  Created by Nguyễn Đức Quang on 9/28/19.
//  Copyright © 2019 Nguyễn Đức Quang. All rights reserved.
//

import UIKit

class Cat: NSObject {
    struct CatCellInfo {
        var name: String!
        var image: UIImage!
        var age: Int!
        let type: String!
    }
    
    static var count:Int = 0
    static var catArr = [CatCellInfo]()
    
    class func addCat(name: String!, age: Int!, image: UIImage!, type: String!) {
        catArr.append(CatCellInfo(name: name, image: image, age: age, type: type))
        count += 1
    }
}
