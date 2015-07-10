//
//  DetailViewController.swift
//  ANote
//
//  Created by Mohil, Anukul | Anukul | OPS on 6/5/15.
//  Copyright (c) 2015 Mohil, Anukul | Anukul | OPS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var notesTitle: UITextField!
    @IBOutlet weak var notesDescription: UITextView!

    @IBOutlet weak var notesToolBar: UIToolbar!
    
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notesTitle.text  = allNotes[currentNoteIndex].note["title"]
        notesDescription.text = allNotes[currentNoteIndex].note["data"]
        //ios8 requires this
        self.notesToolBar.removeFromSuperview()
        notesDescription.inputAccessoryView = notesToolBar
        notesDescription.becomeFirstResponder()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (notesDescription.text.isEmpty) {
            allNotes.removeAtIndex(currentNoteIndex)
//            println("Index to be deleted is \(currentNoteIndex)")
        }
        //Reload table to prevent blank empty entry on top
        noteTable?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if notesDescription.text != "" {
            allNotes[currentNoteIndex].note["data"]! = notesDescription.text
            allNotes[currentNoteIndex].note["title"]! = notesTitle.text
            Note.saveNotes()
        }
        
//        noteTable?.reloadData()
        self.navigationController!.popViewControllerAnimated(true)
    }
    

    //To enable users to tap outside writing space to dismiss keyboard
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }

}
