//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tanveer Singh on 19/08/2017.
//  Copyright (c) 2017 Tanveer Singh. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
//step 1 is to add this ^

//step 2 is to add CLLocationManagerDelegate
class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    //    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    let APP_ID = "d25aff760d8458d0298b11c835c23f7b"
    
    
    //step 3 -> Create an object of CLLocationManager type
    let locationManager = CLLocationManager()
    
    let weatherDataModel = WeatherDataModel()
    
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
        // this is an ASYNCHRONOUS METHOD, RUNS IN THE BACKGROUND. WOULD FREEZE IF NOT HAD BEEN ASYNC.
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //getWeatherData method here:
    func getWeatherData(url: String, parameters: [String : String]){
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success")
                
                //json data from API
                let weatherJSON : JSON = JSON(response.result.value!)
                
                //parsing the JSON data
                self.updateWeatherData(json: weatherJSON)
                
            }else{
                print("Error: \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection issues"
            }
        }
    }
    
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    //updateWeatherData method here:
    func updateWeatherData(json: JSON){
        
        if let tempResult = json["main"]["temp"].double {
            
            weatherDataModel.temperature = Int(tempResult - 273.15)
            
            weatherDataModel.city = json["name"].stringValue
            
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        
            updateUIWithWeatherData()
            
        }else{
            cityLabel.text = "Weather unavailable"
        }
    }
    
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //updateUIWithWeatherData method here:
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = String(weatherDataModel.temperature)
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0{
            locationManager.stopUpdatingLocation()
            //uncomment the line below if updating location is taking time to stop ie printing infinitely
            //locationManager.delegate = nil
            
            print("Longitude: \(location.coordinate.longitude) Latitude: \(location.coordinate.latitude)")
            //sending data to the API
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            //calling alamofire function written in NETWORKING SECTION
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    
    //didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //userEnteredANewCityName Delegate method here:
    func userEnteredANewCityName(city: String) {
        print(city)
    }
    
    
    //PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName"{
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
    
    
    
    
}


