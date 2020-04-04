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
                            self.nameLabel.text = self.placeDetails["name"] as! String

                            
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

