//
//  MainScreen.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 20/06/23.
//

import SwiftUI



struct MainScreen: View {

    @ObservedObject private var ListViewModel = WeatherListViewModel()
    
   let MainScreenBackgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.color1, Color.color2]), startPoint: .top, endPoint: .bottom)
    
    @Environment(\.editMode) var editMode
    
   
    

    
    
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:-20){
                CustomSearchBar(searchText: $ListViewModel.searchText, prompt: "Search for a city")
                    .padding()
                
                List(ListViewModel.weatherData,selection: $ListViewModel.selectedItems){_ in
                    ForEach(ListViewModel.filteredItems){weatherData in
                        WeatherCard(WeatherCardViewDetails: WeatherCardViewModel(weatherCardDetails: weatherData))
                                    .listRowBackground(Color.clear)
                                    .frame(width: 338, height: 185)
                                    .padding(.leading)
                    }
                    .onDelete (perform: ListViewModel.deleteweatherRecord)
                            .deleteDisabled(true)
                    
                }.listStyle(.plain)
                .scrollContentBackground(.hidden)
      
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Weather")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                            .buttonStyle(CustomEditButtonStyle())
                            Menu {
                                Button("Refresh", action: ListViewModel.performRefresh)
                                Button("Delete", action: {
                                    ListViewModel.deletemultipleweatherRecord()
                            
                                })

                            } label: {
                                Image("dots")
                                    .foregroundColor(.white)
                            }
                        }
                }
   
            }
            .background(
                MainScreenBackgroundGradient)

            .refreshable {
                ListViewModel.performRefresh()
            }
        }
        
    }

    }

    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            MainScreen()
        }
    }
