/*
 PlaceDescription.swift
 Assign6jfijewsk
 
 Created by James on 3/18/20.
 Copyright © 2020 James. All rights reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 @author   James Fijewski   mailto:jfijewsk@asu.edu.
 @version March 18, 2020
*/

import Foundation

struct PlaceDescription: Codable{
    
    var name : String
    var description : String
    var category : String
    var address_title : String
    var address : String
    var image: String
    var elevation : Int
    var latitude : Int
    var longitude : Int
    

    
    
    // Constructor for setting up new placeDescription
    init(name : String, description : String, category : String, address_title : String,image :String , address : String, elevation : Int, latitude : Int, longitude : Int) {
        self.name = name
        self.description = description
        self.category = category
        self.address_title = address_title
        self.address = address
        self.elevation = elevation
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
    }
    
    init(dict: [String:Any]){
        self.name = dict["name"] as! String
        self.description = dict["description"] as! String
        self.category = dict["category"] as! String
        self.address_title = dict["address_title"] as! String
        self.address = dict["address"] as! String
        self.image = dict["image"] as! String

        self.elevation = dict["elevation"] as! Int
        self.latitude = dict["latitude"] as! Int
        self.longitude = dict["longitude"] as! Int
    }
    
    func toJsonString() -> String {
        var jsonStr = "";
        let dict = ["name": name, "description": description, "category":category,"address_title": address_title, "image": image,"address-street": address, "elevation":elevation,"latitude": latitude, "longitude":longitude ] as [String : Any]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            jsonStr = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        } catch let error as NSError {
            print(error)
        }
        return jsonStr
    }
    
    /*
    
    // JSON Contructor
    // TODO
    init(json : String){
        self.name = "name"
        self.description = "description"
        self.category = "category"
        self.address_title = "address_title"
        self.address = "address"
        self.elevation = 0.0
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    // NEED TO TEST
    func calc_distance(lat1:Double, lon1:Double, lat2:Double, lon2:Double) -> Double {
        let lat1rad = lat1 * Double.pi/180
        let lon1rad = lon1 * Double.pi/180
        let lat2rad = lat2 * Double.pi/180
        let lon2rad = lon2 * Double.pi/180
        
        let dLat = lat2rad - lat1rad
        let dLon = lon2rad - lon1rad
        let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1rad) * cos(lat2rad)
        let c = 2 * asin(sqrt(a))
        let R = 6372.8
        
        return R * c
    }
    
    // NEED TO TEST
    func calc_heading(lat1:Double, lon1:Double, lat2:Double, lon2:Double) -> Double {
        
        let y = sin(lon2-lon1) * cos(lat2);
        let x = cos(lat1)*sin(lat2) -
            sin(lat1)*cos(lat2)*cos(lon2-lon1);
        return (atan2(y, x)) * 180 / Double.pi;
       
    }
 */
    
}
