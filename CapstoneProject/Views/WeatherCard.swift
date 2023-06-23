//
//
//  WeatherCard.swift
//  CaptstoneProject
//
//  Created by Rupali Bisht on 20/06/23.
//


import SwiftUI

struct WeatherCard: View {
    
    @StateObject var WeatherCardViewDetails : WeatherCardViewModel
    
    var body: some View {
        NavigationLink(destination: DetailedView(WeatherDetailedView: WeatherCardViewModel(weatherCardDetails: WeatherCardViewDetails.WeatherCardDetails))){
            ZStack{
                Image("Rectangle 1")
                
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("\(WeatherCardViewDetails.WeatherCardDetails.currentTemperature.formatted())°")
                            .fontWeight(.regular)
                            .font(.system(size:60 ))
                        
                        Text("H:\(WeatherCardViewDetails.WeatherCardDetails.highestTemperature.formatted())° L:\(WeatherCardViewDetails.WeatherCardDetails.lowestTemperature.formatted())°")
                            .fontWeight(.ultraLight)
                            .font(.system(size: 15))
                        
                        Text("\(WeatherCardViewDetails.WeatherCardDetails.cityName), \(WeatherCardViewDetails.WeatherCardDetails.country)")
                            .font(.system(size: 15))
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing:7 ){
                        Image(WeatherCardViewDetails.WeatherCardDetails.weatherCondition)
                        
                        Text(WeatherCardViewDetails.WeatherCardDetails.weatherCondition)
                            .font(.system(size: 13))
                            .padding(.trailing,35.0)
                        
                    }.offset(y:-20)
                    Spacer()
                }.offset(x:30)
                .foregroundColor(Color.white)
            }
            
            
        }
            
        .background(Color.clear)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherCard(WeatherCardViewDetails : WeatherCardViewModel(weatherCardDetails: Weather(cityName: "Coimbatore", country: "India", currentTemperature: 19, highestTemperature: 24, lowestTemperature: 18, weatherCondition: "Mid Rain"
                             )))
    }
}

