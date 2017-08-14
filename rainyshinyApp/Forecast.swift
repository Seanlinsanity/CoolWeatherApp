//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by SEAN on 2017/8/9.
//  Copyright © 2017年 SEAN. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    var lowTemp: String{
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }

    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
            
            let kelvinToCelsius = Double(round(100 * (min - 273.15) / 100))
                
            self._lowTemp = "\(kelvinToCelsius)"

        }
            if let max = temp["max"] as? Double {
            
            let kelvinToCelsius = Double(round(100 * (max - 273.15) / 100))
                
            self._highTemp = "\(kelvinToCelsius)"
   
            }
        }
        //leave temp dictionary, pull data from weather dictionary
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}



//get the day of the week from the date
//extension should be built outsidet the class
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" //EEEE => I want the "Full" name of the day of week
        return dateFormatter.string(from: self) //self => get the date in this viewcontroller
}
}
