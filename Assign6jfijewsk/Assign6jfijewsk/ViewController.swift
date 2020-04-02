//
//  ViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 3/18/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var urlAddress = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Read in infoPlist values
        readPropertyList()
        getNames()
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
        do{
            let dictionary = Bundle.main.infoDictionary
            urlAddress = dictionary?["ServerUrl"] as! String
        }
        catch {
            print("Error reading plist")
            urlAddress = "http://127.0.0.1:8080"
        }
    }
    

    // Gets the names of the locations from the server
    func getNames(){
        var stub = StudentCollectionStub(urlString: urlAddress)

        let resGetNames:Bool = stub.getNames(callback: { (res: String, err: String?) -> Void in
            if err != nil {
                print("Error in getting names: \(String(describing: err))")
            }else{
                // no error, then the result, is a jsonrpc response with the value of result being an array of student names.
                print("jsonrpc response to getNames is: \(res)")
            }
            
        })
}
}

