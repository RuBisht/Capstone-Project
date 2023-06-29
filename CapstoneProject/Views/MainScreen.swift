//
//  MainScreen.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 20/06/23.
//

import SwiftUI
import Foundation


struct MainScreen: View {

    @StateObject var weatherListViewModel = WeatherListViewModel()
    let constants = Constants()
    
    @State private var editMode: EditMode = .inactive
    var body: some View {
        
        NavigationView{
            VStack{
                CustomSearchBar(searchText: $weatherListViewModel.searchText, prompt: constants.searchprompt)
                    .padding()
                
                WeatherList(listViewModel: weatherListViewModel)
                
                    .environment(\.editMode, $editMode)
                
                    
                    .toolbar {
                        CustomToolbar(weatherListViewModel: weatherListViewModel, editMode: $editMode, constants: constants)
                        }

            }
            .background(
                constants.mainScreenBackgroundGradient)

        }
        
    }

    }

    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            MainScreen()
        }
    }

// LIST SUBVIEW

struct WeatherList: View {
    @ObservedObject var listViewModel: WeatherListViewModel
    
    var body: some View {
        
        List(selection: $listViewModel.selectedItems){
            ForEach(listViewModel.filteredItems){weatherData in
               if(editMode == .active){
                    WeatherCard(weatherCardViewModel: WeatherCardViewModel(weatherCardDetails: weatherData)).deleteDisabled(true)
                        .listRowBackground(Color.clear)
                        .frame(width: 338, height: 185)
                        .padding(.leading)
                }
                else{
                    WeatherCard(weatherCardViewModel: WeatherCardViewModel(weatherCardDetails: weatherData))
                        .listRowBackground(Color.clear)
                        .frame(width: 338, height: 185)
                        .padding(.leading)
                }

            }
            .onDelete(perform: listViewModel.deleteWeatherRecord)
            
        }.listStyle(.plain)
    }
}

// TOOLBAR

struct CustomToolbar: ToolbarContent{
    @ObservedObject var weatherListViewModel: WeatherListViewModel
    @Binding var editMode: EditMode
    let constants: Constants
    var body: some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading){
            Text(constants.weather)
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            
            Button(action: {
                weatherListViewModel.selectedItems = []
                editMode = editMode == .active ? .inactive : .active
            }, label: {
                Image(systemName: constants.highlighter )
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            })
            
            Menu {
                Button(constants.refresh, action: {
                    weatherListViewModel.loadData()
                    editMode = .inactive
                    
                })
                Button(constants.delete,action: {
                    weatherListViewModel.deleteMultipleWeatherRecord()
                    editMode = .inactive
                })
                
            } label: {
                Image(constants.dots)
                    .foregroundColor(.white)
            }
        }
    }
}
