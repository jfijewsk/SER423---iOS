/*
 PlaceLibrary.swift
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

class PlaceDescription: Decodable{
    
    var name : String
    var description : String
    var category : String
    var address_title : String
    var address : String
    var elevation : Double
    var latitude : Double
    var longitude : Double
    
    // Constructor for setting up new placeDescription
    init(name : String, description : String, category : String, address_title : String, address : String, elevation : Double, latitude : Double, longitude : Double) {
        self.name = name
        self.description = description
        self.category = category
        self.address_title = address_title
        self.address = address
        self.elevation = elevation
        self.latitude = latitude
        self.longitude = longitude
    }
    
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
    
}
