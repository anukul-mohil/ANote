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
    var note = [String:String]()
    
    override init() {
        date = NSDate().description
        note = ["title":"","data":""]
    }
    
    
    //save array of dictionary and save it to persisitent storage
    class func saveNotes(){
        var aDictionary = [String:[String:String]]()
        //looping thru notes and convert them to dictionary
        for var i:Int = 0;i < allNotes.count; i++ {
            if(!(allNotes[i].note["data"] == "")){
            aDictionary.updateValue(allNotes[i].note, forKey: allNotes[i].date)
            }
        }
//        println(aDictionary)
        //saving to persistent storage
        NSUserDefaults.standardUserDefaults().setObject(aDictionary, forKey: kAllNotes)
    }
   
    //Load data from persistent storage in to table-allNotes
    class func loadNotes(){
        var savedData :[String:[String:String]]?
        
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()

        savedData = defaults.objectForKey(kAllNotes) as? [String : [String:String]]

        //unwrap optional data and see if it exists
        if let data:[String:[String:String]] = savedData {
            allNotes = []
            for (date,note) in data {
                var n:Note = Note()
                n.date = date
                n.note = note
                allNotes.append(n)
            }
        }
        
    }
}
