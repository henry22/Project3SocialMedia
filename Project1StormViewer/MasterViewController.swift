//
//  MasterViewController.swift
//  Project1StormViewer
//
//  Created by Henry on 4/26/15.
//  Copyright (c) 2015 Henry. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    //Know for sure that the objects we're adding will always be strings, so we can change that declaration AnyObject to String
    var objects = [String]()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Let us work with the filesystem, and we'll be using it to look for files.
        let fileManager = NSFileManager.defaultManager()
        //Where I can find all those images I added to my app
        let path = NSBundle.mainBundle().resourcePath!
        //That is set to the contents of the directory at a path
        let items = fileManager.contentsOfDirectoryAtPath(path, error: nil)
        
        for item in items as! [String] {
            //if the item has the prefix "nssl"
            if item.hasPrefix("nssl") {
                //Adds the matching filename to the end of a list called objects
                objects.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.detailItem = objects[indexPath.row]
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        //delete the part that says as NSDate and the part that says .description
        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    

}

