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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"drawAShape:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "What have you learned today ?"
        notification.timeZone = NSTimeZone.defaultTimeZone()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        
    }
    
    @IBAction func setAlarm(sender: AnyObject) {
        _ = "YYYY-MM-DD HH:MM:SS"
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
    
    func drawAShape(notification:NSNotification){
        let view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
        
    }
    
    func showAMessage(notification:NSNotification){
        let message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }
    
  
    
    //To enable users to tap outside writing space to dismiss keyboard
    //    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    //        self.view.endEditing(true)
    //    }
    
}
