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

//    var detailItem: AnyObject? {
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }
    var editTitle = "hoge"
    var editDesc = "hoge"
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail: AnyObject = self.detailItem {
//            if let label = self.noteTitle {
//                label.text = detail.description
//            }
//        }
       // notesTitle.text = self.editTitle
        //notesDescription.text = self.editDesc
        
//        if let result = self.detailItem as? String{
//            println("Received value is \(result)")
//            notesDescription.text = result
//        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.configureView()
        // Do any additional setup after loading the view.
        notesDescription.text = allNotes[currentNoteIndex].note
        notesDescription.becomeFirstResponder()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if notesDescription == "" {
            allNotes.removeAtIndex(currentNoteIndex)
        }
        else{
            allNotes[currentNoteIndex].note = notesDescription.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        let controller = segue.destinationViewController as! MasterTableViewController
//        println("Deleted value is \(self.editTitle)")
////        controller.notesDB[self.editTitle] = nil
////        controller.notesDB.removeValueForKey(self.editTitle)
////        controller.notesDB.updateValue(notesDescription.text, forKey: notesTitle.text)
//    }

    //To enable users to tap outside writing space to dismiss keyboard
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }
}
