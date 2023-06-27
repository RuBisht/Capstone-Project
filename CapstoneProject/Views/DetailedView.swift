//
//  DetailedView.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 21/06/23.
//

import SwiftUI

struct DetailedView: View {
    let weatherDetailedViewModel : WeatherCardViewModel
    let constants = Constants()
    
    var body: some View {
        ZStack {
            
            Image(constants.detailedViewBackground)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                    Text(weatherDetailedViewModel.getCityName())
                        .font(.system(size: 34))
                    
                    Text(weatherDetailedViewModel.getCurrentTemperature())
                        .font(.system(size: 96))
                        .fontWeight(.light)
                        .padding(.leading)
                    
                    
                    VStack{
                        
                        Text(weatherDetailedViewModel.getWeatherCondition())
                            .fontWeight(.ultraLight)
                        Text(weatherDetailedViewModel.getHighestAndLowestTemperature())
                    }.font(.system(size: 20))
   
                Image(constants.house)
                
                
            }.foregroundColor(.white)
        }
    
    }}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(weatherDetailedViewModel: WeatherCardViewModel(weatherCardDetails: Weather(cityName: "Coimbatore", country: "India", currentTemperature: 19, highestTemperature: 24, lowestTemperature: 18, weatherCondition: "Mid Rain")))
    }
}
