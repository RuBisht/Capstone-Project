//
//  DetailedView.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 21/06/23.
//

import SwiftUI

struct DetailedView: View {
    let WeatherDetailedView : WeatherCardViewModel
    var body: some View {
        ZStack {
            
            Image("photo-1436891620584-47fd0e565afb 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
            
            
            VStack{
                VStack(spacing: -15){
                    Text(WeatherDetailedView.WeatherCardDetails.cityName)
                        .font(.system(size: 34))
                    
                    Text("\(WeatherDetailedView.WeatherCardDetails.currentTemperature.formatted())°")
                        .font(.system(size: 96))
                        .fontWeight(.light)
                        .padding(.leading)
                    
                    
                    VStack{
                        
                        Text("\(WeatherDetailedView.WeatherCardDetails.weatherCondition)")
                            .fontWeight(.ultraLight)
                        Text("H:\(WeatherDetailedView.WeatherCardDetails.highestTemperature.formatted())° L:\(WeatherDetailedView.WeatherCardDetails.lowestTemperature.formatted())°")
                    }.font(.system(size: 20))
                }.offset(y:-50)
                    .foregroundColor(.white)
                Image("House 4 3")
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        }
    
    }}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(WeatherDetailedView: WeatherCardViewModel(weatherCardDetails: Weather(cityName: "Coimbatore", country: "India", currentTemperature: 19, highestTemperature: 24, lowestTemperature: 18, weatherCondition: "Mid Rain")))
    }
}
