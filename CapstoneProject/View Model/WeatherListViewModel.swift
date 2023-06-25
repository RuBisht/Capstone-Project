//
//  DetailedListViewModel.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    @Published var weatherData = [Weather]()
     var selectedItems = Set<UUID>()
     var isRefreshing = false
    @Published var searchText = ""
    
    init(){
        loadData()
    }
    
    var filteredItems: [Weather] {
        if searchText.isEmpty {
            return weatherData
        } else {
            return weatherData.filter { $0.cityName.contains(searchText) }
        }
    }

    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Weather", withExtension: "json")
        else {
            return
        }
        
        guard let data = try? Data(contentsOf: url)
        else{
            return
        }
        
        guard let weatherData = try? JSONDecoder().decode([Weather].self, from: data)
        else{
            return
        }
            
        self.weatherData = weatherData
                
           

//
//<<<<<<< HEAD
//
//
//
//
//
//
//=======
//>>>>>>> cc0e117 (Made the changes in WeatherCardViewModel)
    }
    
     func deleteMultipleWeatherRecord() {
        for id in selectedItems {
            if let index = weatherData.lastIndex(where: { $0.id == id }) {
                weatherData.remove(at: index)
            }
        }
        selectedItems = Set<UUID>()
        
    }
    
    func performRefresh() {
        isRefreshing = true
        
        loadData()
        
        isRefreshing = false
    }
    
    func deleteWeatherRecord(offsets: IndexSet) {
        weatherData.remove(atOffsets: offsets)
    }



}
