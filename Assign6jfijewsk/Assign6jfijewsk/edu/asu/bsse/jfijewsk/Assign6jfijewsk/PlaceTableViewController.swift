//
//  PlaceTableViewController.swift
//  Assign6jfijewsk
//
//  Created by James on 4/2/20.
//  Copyright © 2020 James. All rights reserved.
//

import UIKit
import Foundation

class PlaceTableViewController: UITableViewController {

    //var allPlaces:[(name: String)]
    var urlAddress = ""
    var nameOfPlaces : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read in infoPlist values
        readPropertyList()
        getNames()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(nameOfPlaces.count)
        return nameOfPlaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)

        //let aPlaceName :(name:String,type: String) = nameOfPlaces[indexPath.row]
        cell.textLabel?.text = nameOfPlaces[indexPath.row] as? String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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

                // Get string data and turn it into json
                if let data = res.data(using: .utf8) {
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: data) as? [String: Any]{
                            //print(jsonResult)
                            self.nameOfPlaces = jsonResult["result"] as! NSArray
                            self.tableView.reloadData()

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
            

                
                // no error, then the result, is a jsonrpc response with the value of result being an array of student names.
                //print("jsonrpc response to getNames is: \(res)")
            //}
            
            //return res
            
        })
        //print(nameOfPlaces)

        //let nilArray: NSArray = []
        //return nilArray

    }


}

func populateCells(){
    
}
