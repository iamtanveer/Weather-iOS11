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
    
    
    //Write the didUpdateLocations method here:
    
    
    
    //Write the didFailWithError method here:
    
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


