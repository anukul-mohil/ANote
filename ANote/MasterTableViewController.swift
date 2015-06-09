//
//  MasterTableViewController.swift
//  ANote
//
//  Created by Mohil, Anukul | Anukul | OPS on 6/5/15.
//  Copyright (c) 2015 Mohil, Anukul | Anukul | OPS. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    @IBOutlet var toDoListTable: UITableView!
//    var notesDB = ["FUJIQ": "Schedule the next trip to Fuji Q", "Meetings": "Meeting with provisioning team on Monday", "Pay Bills": "Pay Room rent , Electricity bill","Things to buy": "Buy a Car"]
//    
        override func viewDidLoad() {
        super.viewDidLoad()
            Note.loadNotes()
            noteTable = self.tableView
            
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false
            
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
         let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
//    var titlesArray = ["FUJIQ","Meetings","Pay Bills","Things to buy"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject){
        allNotes.insert(Note(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        self.performSegueWithIdentifier("arrayDetail", sender: self)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
//        cell.textLabel!.text = titlesArray[indexPath.row]
        let object = allNotes[indexPath.row]
        cell.textLabel!.text = object.note
        return cell
    }
    
    //update table values
//    override func viewDidAppear(animated: Bool) {
//        toDoListTable.reloadData()
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            allNotes.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
//        if segue.identifier == "arrayDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow(){
//                let rowIndex = indexPath.row
//                let notesDescription = notesDB[titlesArray[rowIndex]]
//                let controller = segue.destinationViewController as! DetailViewController
//                println("Title passed is \(titlesArray[rowIndex]) and Description passed is \(notesDescription)")
//                controller.editTitle = titlesArray[rowIndex]
//                controller.editDesc = notesDescription!
////                notesDB.removeValueForKey(titlesArray[rowIndex])
//            }
//            
//        }
        if segue.identifier == "arrayDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let object = allNotes[indexPath.row]
                currentNoteIndex = indexPath.row
                }
            else{
                currentNoteIndex = 0
            }
        }

    }
}
