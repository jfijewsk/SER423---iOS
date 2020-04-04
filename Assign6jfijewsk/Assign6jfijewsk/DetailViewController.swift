//
//  ViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 3/18/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressTitleLabel: UILabel!
    @IBOutlet weak var addressLabel1: UILabel!
    @IBOutlet weak var addressLabel2: UILabel!
    @IBOutlet weak var addressLabel3: UILabel!
    @IBOutlet weak var elevationLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var urlAddress = ""
    var passedPlaceName = ""
    var placeDetails : NSDictionary = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Read in infoPlist values
        readPropertyList()
        //getNames()
        print(passedPlaceName)
        getDetails(name: passedPlaceName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }
    
    
    func readPropertyList() {
        // Getting info plist as a dictionary
        let dictionary = Bundle.main.infoDictionary
        urlAddress = (dictionary!["ServerUrl"] as? String)!
    }
    

    // Gets the names of the locations from the server
    func getDetails(name: String){
        let stub = PlaceCollectionStub(urlString: urlAddress)

        let _:Bool = stub.get(name: "ASU-Poly", callback: { (res: String, err: String?) -> Void in
            if err != nil {
                print("Error in getting names: \(String(describing: err))")
            }else{
                // no error, then the result, is a jsonrpc response with the value of result being an array of student names.
                //print("jsonrpc response to getNames is: \(res)")
                // Get string data and turn it into json
                if let data = res.data(using: .utf8) {
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                            //print(jsonResult)
                            self.placeDetails = jsonResult["result"] as! NSDictionary
                            
                            print(self.placeDetails)
                            self.nameLabel.text = self.placeDetails["name"] as? String
                            self.addressTitleLabel.text = self.placeDetails["address-title"] as? String
                            
                            var addressArray = (self.placeDetails["address-street"] as? String)?.components(separatedBy: "$")
                            
                            self.addressLabel1.text = addressArray?[0]
                            self.addressLabel2.text = addressArray?[1]
                            self.addressLabel3.text = addressArray?[2]
                            
                            let elevation = self.placeDetails["elevation"] as? NSNumber
                            let stringElevation = elevation?.stringValue
                            
                            let latitude = self.placeDetails["latitude"] as? NSNumber
                            let stringlatitude = latitude?.stringValue
                            
                            let longitude = self.placeDetails["longitude"] as? NSNumber
                            let stringlongitude = longitude?.stringValue
                            
                            self.elevationLabel.text = stringElevation
                            self.latitudeLabel.text = stringlatitude
                            self.longitudeLabel.text = stringlongitude
                            self.imageLabel.text = self.placeDetails["image"] as? String
                            self.descriptionLabel.text = self.placeDetails["description"] as? String
                            self.categoryLabel.text = self.placeDetails["category"] as? String

                            print("Here is what I think lat is:")
                            print(stringElevation)

                            //print("second pass")
                            //print(nameOfPlaces)
                            
                            //print(namesOfPlaces)
                            
                            //let namesOfPlaces2 = jsonResult["result"] as? [[String: String]]
                            //print(namesOfPlaces2.count)
                            //print(namesOfPlaces.count)
                        }
                    } catch {
                        print("Caught error")
                        print(error.localizedDescription)
                    }
                
            }
            }
            
        })
}
}

