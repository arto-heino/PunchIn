//
//  StudentsViewController.swift
//  punchin
//
//  Created by Arto Heino on 02/05/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataParserObserver {
    
    // These strings will be the data for the table view cells
    var students = [Student]()
    let cellReuseIdentifier = "cell"
    
    var lessonIdToPass: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // It is possible to do the following three things in the Interface Builder
        // rather than in code if you prefer.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedIds = NSUserDefaults.standardUserDefaults()
        let lessonId = savedIds.valueForKey("lessonid") as! Int
        self.students = [Student]()
        let dataParser = DataParser()
        
        dataParser.getAttendList(lessonId, parserObserver: self)
    }
    
    func studentParsed(students: [Student]) {
        self.students = students
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.students.count
    }
    
    func dataParsed(classroom: Room) {
        
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.students[indexPath.row].firstName + " " + self.students[indexPath.row].surname
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}