//
//  ViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 3/18/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        getNames()
    }


    func getNames(){
        var stub = StudentCollectionStub(urlString: "http://127.0.0.1:8080")

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

