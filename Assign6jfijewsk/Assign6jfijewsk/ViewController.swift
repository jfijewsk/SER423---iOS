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
        let dictionary = Bundle.main.infoDictionary
        urlAddress = (dictionary!["ServerUrl"] as? String)!
    }
    

    // Gets the names of the locations from the server
    func getNames(){
        let stub = StudentCollectionStub(urlString: urlAddress)

        let _:Bool = stub.getNames(callback: { (res: String, err: String?) -> Void in
            if err != nil {
                print("Error in getting names: \(String(describing: err))")
            }else{
                // no error, then the result, is a jsonrpc response with the value of result being an array of student names.
                print("jsonrpc response to getNames is: \(res)")
            }
            
        })
}
}

