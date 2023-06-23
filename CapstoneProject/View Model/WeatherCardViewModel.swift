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
}
