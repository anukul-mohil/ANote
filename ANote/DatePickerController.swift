//
//  DetailViewController.swift
//  ANote
//
//  Created by Mohil, Anukul | Anukul | OPS on 6/5/15.
//  Copyright (c) 2015 Mohil, Anukul | Anukul | OPS. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {
    
    var notification:UILocalNotification = UILocalNotification()

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "What have you learned today ?"
        notification.timeZone = NSTimeZone.defaultTimeZone()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "showAMessage", name: <#String?#>, object: <#AnyObject?#>)

        
    }
    
    @IBAction func setAlarm(sender: AnyObject) {
        var format = "YYYY-MM-DD HH:MM:SS"
        //notificationLabel.text = self.datePicker.date.descriptionWithLocale(format)
        self.notification.fireDate = self.datePicker.date
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        //Dismiss popover
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    //To enable users to tap outside writing space to dismiss keyboard
    //    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    //        self.view.endEditing(true)
    //    }
    
}
