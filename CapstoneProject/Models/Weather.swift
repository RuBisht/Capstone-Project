//
//  WeatherData.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import Foundation

struct Weather: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case cityName
        case country
        case currentTemperature
        case highestTemperature
        case lowestTemperature
        case weatherCondition
    }
    
    let id = UUID()
    let cityName: String
    let country: String
    let currentTemperature: Int
    let highestTemperature: Int
    let lowestTemperature: Int
    let weatherCondition: String
}



