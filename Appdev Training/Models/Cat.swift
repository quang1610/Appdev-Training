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
    
    // This function load cat json info file from the internet and after it finish loading the json file, it will call completion function in order to process the result
    class func loadCats(completion : @escaping (Array<Dictionary<String, String>>) -> Void) {
        let url = URL(string: "https://chenziwe.com/cats")
        let session = URLSession(configuration: .default)
        var request = URLRequest(url:url!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) {                                                     // Are there anyway we can print out error in our request?
                print("Fail to load cat")
                return
            } else {
                print("We load cat successfully")
                
                let result = try? JSONSerialization.jsonObject(with: data!, options: []) as? Array<Dictionary<String, String>>
                
                completion(result!)
            }
        }
        task.resume()
    }
}
