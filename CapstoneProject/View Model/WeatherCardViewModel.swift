//
//  WeatherCardViewModel.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import Foundation
struct WeatherCardViewModel{
    
    var weatherCardDetails : Weather
    
    func getLocation() -> String {
         return "\(weatherCardDetails.cityName), \(weatherCardDetails.country)"
    }
    
    func getWeatherCondition() -> String {
        return "\(weatherCardDetails.weatherCondition)"
    }
    
    func getCurrentTemperature() -> String {
        return "\(weatherCardDetails.currentTemperature)°"
    }
    
    func getHighestAndLowestTemperature() -> String {
        return "H:\(weatherCardDetails.highestTemperature)° L:\(weatherCardDetails.currentTemperature)°"
    }
    
    func getCityName() -> String {
        return weatherCardDetails.cityName
    }
}
