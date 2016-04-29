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
    
    @IBOutlet weak var navBar: UINavigationBar!

    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var studentIdTextField: UITextField!
    
    @IBOutlet weak var saveLoginButton: UIButton!

    @IBOutlet weak var lessonTextField: UITextField!
    
    @IBOutlet weak var teachersTextField: UITextField!
    
    
    @IBAction func materialsAction(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://drive.google.com/drive/u/1/folders/0B9Ne_ibI0-RHTzZzTWg1ekdNYUE")!)
        
    }
    
    
    
    // BEACON MANAGER
    
    
    
    let beaconManager = ESTBeaconManager()
    let post = HttpPost()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "DBB26A86-A7FD-45F7-AEEA-3A1BFAC8D6D9")!,
        identifier: "ranged region")
    
    override func viewDidLoad() {
        print("viewdidload")
        super.viewDidLoad()

        lastnameTextField?.delegate = self
        studentIdTextField?.delegate = self
        // 3. Set the beacon manager's delegate

        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        
        let logoImage = UIImageView(frame: CGRect(x:0, y:0, width: 200, height: 45))
        logoImage.contentMode = .ScaleAspectFit
        
        let logo = UIImage(named: "Image")
        logoImage.image = logo
        self.navigationItem.titleView = logoImage
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    

    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        //saveLoginButton.enabled = false
    }
    
    func checkValidLastName() {
        // Disable the Save button if the text field is empty.
        let text = lastnameTextField.text ?? ""
        //saveLoginButton.enabled = !text.isEmpty
    }
    
    
    func checkValidStudentId() {
        // Disable the Save button if the text field is empty.
        let text = studentIdTextField.text ?? ""
        //saveLoginButton.enabled = !text.isEmpty
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidLastName()
        checkValidStudentId()
        navigationItem.title = textField.text
    }

    
    @IBAction func login(sender: UIButton) {
        let studentId:Int? = Int(studentIdTextField.text!)
        post.setStudentNumber(studentId!)
        post.setSurname(lastnameTextField.text!)
        print("posted")
        post.httpPost()
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       inRegion region: CLBeaconRegion) {
        
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
    
    
    
    //setting the parsed data to textfields
    
    func dataParsed(parsedData: Room) {
        let crsId = parsedData.lesson.getCourseId()
        let lsId = parsedData.lesson.getLessonId()
        post.setCourse(crsId)
        post.setLesson(lsId)
        classroom?.text = "\(parsedData.getRoomTitle()) + \(parsedData.getRoomNumber())"
        lessonTextField?.text = "\(parsedData.lesson.getLessonTitle())"
        teachersTextField?.text = "\(parsedData.lesson.getTeachers())"
        courseLabel?.text = "\(parsedData.lesson.getLessonTitle())"
    }
    
    
    
    
    }




