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

    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.configureView()
        // Do any additional setup after loading the view.
        notesDescription.text = allNotes[currentNoteIndex].note
        notesDescription.becomeFirstResponder()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (notesDescription.text.isEmpty) {
            allNotes.removeAtIndex(currentNoteIndex)
            println("Index to be deleted is \(currentNoteIndex)")
        }
//        for var i:Int = 0;i < allNotes.count; i++ {
        for var i:Int = 0;i < allNotes.count; i++ {
            println("Array data is \(allNotes[i].note)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        if notesDescription.text == "" {
            allNotes.removeAtIndex(currentNoteIndex)
        }
        else {
            allNotes[currentNoteIndex].note = notesDescription.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
        self.navigationController!.popViewControllerAnimated(true)
    }
    

    //To enable users to tap outside writing space to dismiss keyboard
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }

}
