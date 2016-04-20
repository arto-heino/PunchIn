//
//  ViewController.swift
//  punchin
//
//  Created by Arto Heino on 24/03/16.
//  Copyright © 2016 Arto Heino. All rights reserved.
//


import UIKit

class ViewController: UIViewController, ESTBeaconManagerDelegate {
    
    @IBAction func cancel(sender: UIBarButtonItem) {
            dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func cancelFromCourseView(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var rSSi: UILabel!
    
    @IBOutlet weak var proximity: UILabel!
    
    @IBOutlet weak var accuracy: UILabel!
    
    @IBOutlet weak var info: UILabel!
    
    
    
    @IBOutlet weak var classroom: UILabel!
    
    
    @IBAction func searchBeacons(sender: AnyObject) {
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
        classroom?.text = "No beacons nearby, can't punch in!"
        courseLabel?.text = "No course available!"
        
    }
    
    @IBOutlet weak var courseLabel: UILabel!
    
    
    // 2. Add the beacon manager and the beacon region
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "3F8471A3-7BF2-4757-8DC4-3C0308310688")!,
        identifier: "ranged region")
    
    override func viewDidLoad() {
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
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    // Add the property holding the data.
    // TODO: replace "<major>:<minor>" strings to match your own beacons
    
    
    let placesByBeacons = [
        "1319:50423": [
            "Aquarium": 50, // read as: it's 50 meters from
        ]
       /* "major:minor": [
            "Reef":
         */
    ]
    
    
    func placesNearBeacon(beacon: CLBeacon) -> [String] {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacons[beaconKey] {
            let sortedPlaces = Array(places).sort(){ $0.1 < $1.1 }.map { $0.0 }
            return sortedPlaces
        }
        return []
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            let places: [String] = placesNearBeacon(nearestBeacon)

            
            info?.text = String(nearestBeacon)
            accuracy?.text = String(nearestBeacon.accuracy)
            rSSi?.text = String(nearestBeacon.rssi)
            proximity?.text = String(nearestBeacon.proximityUUID)
            courseLabel?.text = "\(nearestBeacon.minor) + \(nearestBeacon.major)"
            classroom?.text = "\(places)"
            
        }
    }
    
    
    
}



