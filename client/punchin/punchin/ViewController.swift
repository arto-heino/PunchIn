//
//  ViewController.swift
//  punchin
//
//  Created by Arto Heino on 24/03/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ESTBeaconManagerDelegate, DataParserObserver {
    
    
    var nearestBeaconMajor: NSNumber = 0
    
    var nearestBeacon: CLBeacon?
    
    //BUTTONS
    
    @IBAction func cancel(sender: UIBarButtonItem) {
            dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelFromCourseView(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var classroom: UILabel!
    
    
    @IBAction func searchBeacons(sender: AnyObject) {
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
        nearestBeacon = nil
        classroom?.text = "No beacons nearby, can't punch in!"
        courseLabel?.text = "No course available!"
        
    }
    
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var lessonTextField: UITextField!
    
    @IBOutlet weak var teachersTextField: UITextField!
    
    
    @IBAction func materialsAction(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://drive.google.com/drive/u/1/folders/0B9Ne_ibI0-RHTzZzTWg1ekdNYUE")!)
        
    }
    
    
    
    // BEACON MANAGER
    
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "DBB26A86-A7FD-45F7-AEEA-3A1BFAC8D6D9")!,
        identifier: "ranged region")
    
    override func viewDidLoad() {
        print("viewdidload")
        super.viewDidLoad()
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwillappear")
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
        
    
    
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       inRegion region: CLBeaconRegion) {
        print("beaconmanager")
        
        if beacons.first != nil {
            
        
            
            if nearestBeacon == nil {
                let dataParser = DataParser()
                nearestBeacon = beacons.first
                dataParser.getBeaconData((nearestBeacon?.major)!, parserObserver:self)
            }
        
        
            else if beacons.first!.major != nearestBeacon?.major {
                let dataParser = DataParser()
                nearestBeacon = beacons.first!
                dataParser.getBeaconData((nearestBeacon?.major)!, parserObserver:self)
            
        }
    }
    }
    func dataParsed(parsedData: Room) {
        //let lessonTitle = String(parsedData.lesson.getLessonTitle())
        classroom?.text = "\(parsedData.getRoomTitle()), \(parsedData.getRoomNumber())"
        lessonTextField?.text = "\(parsedData.lesson.getLessonTitle())"
        teachersTextField?.text = "\(parsedData.lesson.getTeachers())"
        courseLabel?.text = "\(parsedData.lesson.getLessonTitle())"
        
        
     /*  print(parsedData.getRoomTitle())
       print(parsedData.lesson.getTeachers())
       print(parsedData.lesson.getLessonTitle())
       print(parsedData.lesson.getCourseId())
       print(parsedData.lesson.getLessonId())
        print(parsedData.lesson.getEndTime())
        print(parsedData.lesson.getStartTime())*/
    
    }
    
    
    
    
    }




