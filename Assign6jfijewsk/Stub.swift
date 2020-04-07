/*
 Stub.swift
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

public class PlaceCollectionStub {
    
    static var id:Int = 0
    
    var url:String
    
    init(urlString: String){
        self.url = urlString
    }
    
    // used by methods below to send a request asynchronously.
    // creates and posts a URLRequest that attaches a JSONRPC request as a Data object. The URL session
    // executes in the background and calls its completion handler when the result is available.
    func asyncHttpPostJSON(url: String,  data: Data,
                           completion: @escaping (String, String?) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.httpBody = data as Data
        //HTTPsendRequest(request: request, callback: completion)
        // task.resume() below, causes the shared session http request to be posted in the background
        // (independent of the UI Thread)
        // the use of the DispatchQueue.main.async causes the callback to occur on the main queue --
        // where the UI can be altered, and it occurs after the result of the post is received.
        let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) -> Void in
            if (error != nil) {
                completion("Error in URL Session", error!.localizedDescription)
            } else {
                DispatchQueue.main.async(execute: {completion(NSString(data: data!,
                                                                       encoding: String.Encoding.utf8.rawValue)! as String, nil)})
            }
        })
        task.resume()
    }
    
    func get(name: String, callback:@escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceCollectionStub.id = PlaceCollectionStub.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"get", "params":[name], "id":PlaceCollectionStub.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url:self.url, data:reqData, completion:callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    
    func add(newPlace: String, callback:@escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceCollectionStub.id = PlaceCollectionStub.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"add", "params":[newPlace], "id":PlaceCollectionStub.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url:self.url, data:reqData, completion:callback)
            ret = true
            
            
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    
    func remove(name: String, callback:@escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceCollectionStub.id = PlaceCollectionStub.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"remove", "params":[name], "id":PlaceCollectionStub.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url:self.url, data:reqData, completion:callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    
    func saveToJsonFile(callback:@escaping (String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceCollectionStub.id = PlaceCollectionStub.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"saveToJsonFile", "params":[], "id":PlaceCollectionStub.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions(rawValue: 0))
            self.asyncHttpPostJSON(url:self.url, data:reqData, completion:callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    
    
    
    
    func getNames(callback:@escaping(String, String?) -> Void) -> Bool{
        var ret:Bool = false
        PlaceCollectionStub.id = PlaceCollectionStub.id + 1
        do {
            let dict:[String:Any] = ["jsonrpc":"2.0", "method":"getNames", "params":[ ], "id":PlaceCollectionStub.id]
            let reqData:Data = try JSONSerialization.data(withJSONObject:dict,               options:JSONSerialization.WritingOptions(rawValue:0))
            self.asyncHttpPostJSON(url:self.url, data:reqData, completion:callback)
            ret = true
        } catch let error as NSError {
            print(error)
        }
        return ret
    }
    
    // callbacks to getNames remote method may use this method to get the array of strings from the jsonrpc result string
    func getStringArrayResult(jsonRPCResult:String) -> [String] {
        var ret:[String] = [String]()
        if let data:NSData = jsonRPCResult.data(using:String.Encoding.utf8) as NSData?{
            do{
                let dict = try JSONSerialization.jsonObject(with: data as Data,options:.mutableContainers) as?[String:AnyObject]
                let resArr:[String] = dict?["result"] as! [String]
                ret = resArr
            } catch {
                print("unable to convert Json to a dictionary")
            }
        }
        return ret
    }
    
    /*
    // callbacks to get remote method may use this method to get the student from the jsonrpc result string
    func getStudentResult(jsonRPCResult:String) -> Student {
        var ret:Student = Student(name: "Un Known")
        if let data:NSData = jsonRPCResult.data(using:String.Encoding.utf8) as NSData?{
            do{
                let dict = try JSONSerialization.jsonObject(with: data as Data,options:.mutableContainers) as?[String:AnyObject]
                let aStud:Student = Student(dict:dict?["result"] as! [String:Any])
                ret = aStud
            } catch {
                print("unable to convert Json to a dictionary")
            }
        }
        return ret
    }
 */
    
}

// Now the method calls have callbacks included with them. So, lets look at sample uses of these classes
//let place:PlaceDescription = PlaceDescription(jsonStr: "{\"name\":\"Tim Lindquist\", \"studentid\":629, \"takes\":[\"Ser423\",\"Ser321\",\"Cse445\"]}")
//print("Student: \(aStud.toJsonString())")



