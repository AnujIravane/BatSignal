//
//  BatAPI.swift
//  Bat Signal
//
//  Created by Anuj Iravane on 9/8/16.
//  Copyright © 2016 JoAnna Mueller. All rights reserved.
//

import Foundation

class BatAPI: NSObject {
    
    var base64LoginString = ""
    
    func login(username: String, password: String, loginCompletionHandler: (success: Bool) -> Void) {
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        
        // create the request
        let url = NSURL(string: "http://127.0.0.1:8000/users/\(username)/")
        guard url != nil else {
            NSLog("could not reach log in endpoint")
            return
            
        }
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            if let error = error {
                loginCompletionHandler(success: false)
                print(error)
            } else if let data = data {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if jsonResult.objectForKey("detail") as? String != "Invalid username/password." {
                        loginCompletionHandler(success: true)
                        self.base64LoginString = base64LoginString
                    } else {
                        loginCompletionHandler(success: false)
                    }
                    print(jsonResult)
                } catch _ {
                    print("wtf is even the point of this")
                }
            }
            
        })
    }
    
    func createBatRequest(receiver: String, requestType: BatRequest, postRequestCompletionHandler: (success: Bool) -> Void) {
        do {
            let data: NSDictionary = ["receiver" : receiver, "requestType" : requestType.rawValue]
            let jsonData = try NSJSONSerialization.dataWithJSONObject(data, options: .PrettyPrinted)
            
            // create post request
            guard let url = NSURL(string: "http://127.0.0.1:8000/batRequests/") else {
                return
            }
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            request.HTTPBody = jsonData
            
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    postRequestCompletionHandler(success: false)
                    return
                }
                if let data = data {
                    do {
                        let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
                        print("Result -> \(result)")
                        postRequestCompletionHandler(success: true)
                    } catch {
                        print("Error -> \(error)")
                        postRequestCompletionHandler(success: false)
                    }
                } else {
                    print ("Error -> data is nil")
                    postRequestCompletionHandler(success: false)
                }
            }
            task.resume()
            return
        
        } catch {
            print(error)
        }
    }
}

extension BatAPI: NSURLConnectionDataDelegate {
    
}