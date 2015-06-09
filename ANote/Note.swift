//
//  Note.swift
//  ANote
//
//  Created by Mohil, Anukul | Anukul | OPS on 6/7/15.
//  Copyright (c) 2015 Mohil, Anukul | Anukul | OPS. All rights reserved.
//

import UIKit

var allNotes:[Note] = []
var currentNoteIndex = -1
var noteTable:UITableView?

//constant
let kAllNotes:String = "notes"

class Note: NSObject {
    var date:String
    var note:String
    
    override init() {
        date = NSDate().description
        note = ""
    }
    
    //convert notes to key-value pairs of dictionaries
    func dictionary()->NSDictionary{
        return ["note":note,"date":date]
    }
    
    //save array of dictionary and save it to persisitent storage
    class func saveNotes(){
        var aDictionary:[NSDictionary] = []
        //looping thru notes and convert them to dictionary
        for var i:Int = 0;i < allNotes.count; i++ {
            aDictionary.append(allNotes[i].dictionary())
        }
        //saving to persistent storage
        NSUserDefaults.standardUserDefaults().setObject(aDictionary, forKey: kAllNotes)
    }
   
    //Load data from persistent storage in to table-allNotes
    class func loadNotes(){
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedData:[NSDictionary]? = defaults.objectForKey(kAllNotes) as? [NSDictionary]
        //unwrap optional data and see if it exists
        if let data:[NSDictionary] = savedData {
            for var i:Int = 0; i < data.count; i++ {
                var n:Note = Note()
                n.setValuesForKeysWithDictionary(data[i] as [NSObject : AnyObject])
                allNotes.append(n)
            }
        }
    }
}
