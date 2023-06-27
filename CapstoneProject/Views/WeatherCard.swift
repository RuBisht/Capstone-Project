//
//
//  WeatherCard.swift
//  CaptstoneProject
//
//  Created by Rupali Bisht on 20/06/23.
//


import SwiftUI

struct WeatherCard: View {
    
    let weatherCardViewModel : WeatherCardViewModel
    let constants = Constants()
    
    var body: some View {
        NavigationLink(destination: DetailedView(weatherDetailedViewModel: WeatherCardViewModel(weatherCardDetails: weatherCardViewModel.weatherCardDetails))){
            ZStack{
                Image(constants.rectangle)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text(weatherCardViewModel.getCurrentTemperature())
                            .fontWeight(.regular)
                            .font(.system(size:60 ))
                        
                        Text(weatherCardViewModel.getHighestAndLowestTemperature())
                            .fontWeight(.ultraLight)
                            .font(.system(size: 15))
                        
                        Text(weatherCardViewModel.getLocation())
                            .font(.system(size: 15))
                    }.padding(.horizontal, 20)
    
                    VStack(alignment: .trailing, spacing:7 ){
                        Image(weatherCardViewModel.getWeatherCondition())
                        
                        Text(weatherCardViewModel.getWeatherCondition())
                            .font(.system(size: 15))
                            .padding(.trailing,35.0)
                        
                    }.padding(.bottom,50)
                }
                .foregroundColor(Color.white)
            }
            
            
        }
            
        .background(Color.clear)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherCard(weatherCardViewModel : WeatherCardViewModel(weatherCardDetails: Weather(cityName: "Coimbatore", country: "India", currentTemperature: 19, highestTemperature: 24, lowestTemperature: 18, weatherCondition: "Mid Rain"
                             )))
    }
}

