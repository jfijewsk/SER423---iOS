//
//  AddPlaceViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 4/5/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit

class AddPlaceViewController: UIViewController {
    var urlAddress = ""

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressTitleText: UITextField!
    @IBOutlet weak var addressText1: UITextField!
    @IBOutlet weak var addressText2: UITextField!
    @IBOutlet weak var addressText3: UITextField!
    
    @IBOutlet weak var elevationText: UITextField!
    @IBOutlet weak var latitudeText: UITextField!
    @IBOutlet weak var longitudeText: UITextField!
    @IBOutlet weak var imageText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var categoryText: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBAction func saveAction(_ sender: Any) {
        print("user hit save")
        if(nameText.text!.isEmpty || descriptionText.text!.isEmpty || categoryText.text!.isEmpty){
            let alert = UIAlertController(title: "Incomplete place description", message: "You must fill out the name description and category for a new place", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        
            self.present(alert, animated: true)
        }
        
        else{
            // Make an async call to server and alert user to data being saved
            readPropertyList()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText!.layer.borderWidth = 1
        descriptionText!.layer.borderColor = UIColor.lightGray.cgColor

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func readPropertyList() {
        // Getting info plist as a dictionary
        let dictionary = Bundle.main.infoDictionary
        urlAddress = (dictionary!["ServerUrl"] as? String)!
    }
    
    
        //init(name : String, description : String, category : String, address_title : String, address : String, elevation : Double, latitude : Double, longitude : Double)
    func savePlace(){
        let stub = PlaceCollectionStub(urlString: urlAddress)
        
        // Create new Place object
        var address1 :String
        var address2 : String
        var address3 : String
        
        address1 = addressText1.text!
        address2 = addressText2.text!
        address3 = addressText3.text!
        
        var completeAddress = address1
        completeAddress += "$"
        completeAddress += address2
        completeAddress += "$"
        completeAddress += address3
        
        // Try to convert user entered fields to doubles
        let parseElevation, parseLatitude, parseLongitude : Double
        do{
            
        }
        
        catch{
            print("Doubles were not entered correctly")
        }
            
        //let newPlace = PlaceDescription(name: nameText.text!, description: descriptionText.text!, category: categoryText.text!, address_title: addressTitleText.text!, address: completeAddress, elevation: elevationText.text!, latitude: latitudeText.text!, longitude: longitudeText.text!)
        
        //let _:Bool = stub.add(callback: {Item: newPlace (res: String, err: String?) -> Void in
            //if err != nil {
                //print("Error saving place: \(String(describing: err))")
           // }else{
                
                
           // }
            
            
       // })

    }



}
