//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tanveer Singh on 19/08/2017.
//  Copyright (c) 2017 Tanveer Singh. All rights reserved.
//

import UIKit
import CoreLocation
//step 1 is to add this ^

//step 2 is to add CLLocationManagerDelegate
class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
//    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    let APP_ID = "d25aff760d8458d0298b11c835c23f7b"
    

//step 3 -> Create an object of CLLocationManager type
    let locationManager = CLLocationManager()

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//step 4 -> Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    //authorization pop-up requesting location
        locationManager.requestWhenInUseAuthorization()
//step 5 -> setup the Info.plist
        
//step 6 -> start updating location
// this is an ASYNCHRONOUS METHOD, RUNS IN THE BACKGROUND. WOULD FREEZE IF NOT.
        locationManager.startUpdatingLocation()

        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0{
            locationManager.startUpdatingLocation()
            print("Longitude: \(location.coordinate.longitude) Latitude: \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
        }
    }
    
    
    //didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


