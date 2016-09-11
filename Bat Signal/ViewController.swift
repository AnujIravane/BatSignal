//
//  ViewController.swift
//  Bat Signal
//
//  Created by JoAnna Mueller on 6/21/15.
//  Copyright (c) 2015 JoAnna Mueller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "save a citizen!"
        localNotification.alertBody = "Gotham needs you Batman!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

