
//
//  Details.swift
//  WeatherAppl
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Details : Decodable

{
    
    //same name as api name in dictionary
    var location : cityWeather
    var current: CurrentDetails
    
    
    
}

class cityWeather:Decodable{
    
    //same name as location : dictionary names
    var name = ""
    var region = ""
    var country = ""
    var localtime = ""
    
    
}
class CurrentDetails:Decodable{
    
    
    // current dictionary of json
    
    var temp_c = ""
    var id_day : Int
    var cloud : Int
    var condition : Condition
}


class Condition :Decodable{
    
    var text = ""
    var icon = ""
}
/*
 {
 "location": {
 "name": "Yasuj Airport",
 "region": "Yasouj",
 "country": "Iran",
 "lat": 30.7,
 "lon": 51.55,
 "tz_id": "Asia/Tehran",
 "localtime_epoch": 1625909040,
 "localtime": "2021-07-10 13:54"
 },
 "current": {
 "last_updated_epoch": 1625908500,
 "last_updated": "2021-07-10 13:45",
 "temp_c": 38,
 "temp_f": 100.4,
 "is_day": 1,
 "condition": {
 "text": "Partly cloudy",
 "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
 "code": 1003
 },
 "wind_mph": 11.9,
 "wind_kph": 19.1,
 "wind_degree": 210,
 "wind_dir": "SSW",
 "pressure_mb": 1013,
 "pressure_in": 30.4,
 "precip_mm": 0,
 "precip_in": 0,
 "humidity": 5,
 "cloud": 25,
 "feelslike_c": 37.1,
 "feelslike_f": 98.7,
 "vis_km": 10,
 "vis_miles": 6,
 "uv": 7,
 "gust_mph": 10.3,
 "gust_kph": 16.6
 }
 }
 
 */


