//
//  ViewController.swift
//  Cocopod
//
//  Created by Sabbir Hossain on 1/14/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit
import Alamofire


struct Course :Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}

//    private enum CodingKeys: String, CodingKey {
//        case name
//        case stars
//        case url
//        case randomDateCommit = "random_date_commit"
//    }



class ViewController: UIViewController {

    @IBOutlet weak var txtview: UITextView!
    
       let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn(_ sender: Any) {
        
        
        //Alamofire.request("https://api.darksky.net/forecast/5c74c06e261c64b3a2f6e1abfb7fe85d/37.8267,-122.4233").responseJSON { response in
            
//            print(response.request as Any)  // original URL request
//            print(response.response as Any) // URL response
//            print(response.result.value as Any)   // result of response serialization
//
//            self.txtview.text = response.description
//
//        }
//
   
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/courses" ).validate().responseJSON { response in
            print(response.debugDescription)
            
            do{
                
                let courses = try self.decoder.decode([Course].self, from: response.data! )
                
                for item in courses {
                    print(item.name!)
                
                    
                self.txtview.text = item.name
                }
                
                } catch{
                
                print("error here")
            }
        }
    }
        
}

