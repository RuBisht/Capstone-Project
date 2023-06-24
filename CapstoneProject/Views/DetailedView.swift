//
//  DetailedView.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 21/06/23.
//

import SwiftUI

struct DetailedView: View {
    let weatherDetailedViewModel : WeatherCardViewModel
    var body: some View {
        ZStack {
            
            Image(detailedViewBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
            
            
            VStack{
                VStack(spacing: -15){
                    Text(weatherDetailedViewModel.getCityName)
                        .font(.system(size: 34))
                    
                    Text(weatherDetailedViewModel.getCurrentTemperature)
                        .font(.system(size: 96))
                        .fontWeight(.light)
                        .padding(.leading)
                    
                    
                    VStack{
                        
                        Text(weatherDetailedViewModel.getWeatherCondition)
                            .fontWeight(.ultraLight)
                        Text(weatherDetailedViewModel.getHighestAndLowestTemperature)
                    }.font(.system(size: 20))
                }.offset(y:-50)
                    .foregroundColor(.white)
                Image(house)
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        }
    
    }}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(weatherDetailedViewModel: WeatherCardViewModel(weatherCardDetails: Weather(cityName: "Coimbatore", country: "India", currentTemperature: 19, highestTemperature: 24, lowestTemperature: 18, weatherCondition: "Mid Rain")))
    }
}
