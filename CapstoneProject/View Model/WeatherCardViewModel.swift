//
//  WeatherCardViewModel.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import Foundation
class WeatherCardViewModel: ObservableObject {
    
    @Published var WeatherCardDetails : Weather
  
    init(weatherCardDetails: Weather){
        self.WeatherCardDetails = weatherCardDetails
    }
    
    var getLocation:String {
         return "\(WeatherCardDetails.cityName), \(WeatherCardDetails.country)"
    }
    
    var getWeatherCondition:String {
        return "\(WeatherCardDetails.weatherCondition)"
    }
    
    var getCurrentTemperature:String {
        return "\(WeatherCardDetails.currentTemperature)°"
    }
    
    var getHighestAndLowestTemperature:String {
        return "H:\(WeatherCardDetails.highestTemperature)° L:\(WeatherCardDetails.currentTemperature)°"
    }
    
    var getCityName:String {
        return WeatherCardDetails.cityName
    }
}
