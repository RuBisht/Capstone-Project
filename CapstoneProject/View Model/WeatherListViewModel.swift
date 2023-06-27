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
        guard let url = Bundle.main.url(forResource: "Weather", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let weatherData = try? JSONDecoder().decode([Weather].self, from: data)
        else {
            return
        }
            
        self.weatherData = weatherData
                
           
    }
    
     func deleteMultipleWeatherRecord() {
        for id in selectedItems {
            if let index = weatherData.lastIndex(where: { $0.id == id }) {
                weatherData.remove(at: index)
            }
        }
        selectedItems = Set<UUID>()
        
    }
    func deleteWeatherRecord(at index: IndexSet) {
        if let currentIndex = index.first {
            weatherData.remove(at: currentIndex)
        }
    }



}
