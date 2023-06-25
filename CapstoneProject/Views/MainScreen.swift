//
//  MainScreen.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 20/06/23.
//

import SwiftUI



struct MainScreen: View {

    @ObservedObject var ListViewModel = WeatherListViewModel()
   
    @State var editMode: EditMode = .inactive

    var body: some View {
        
        NavigationView{
            VStack(spacing:-20){
                CustomSearchBar(searchText: $ListViewModel.searchText, prompt: "Search for a city")
                    .padding()
                
                List(selection: $ListViewModel.selectedItems){
                    ForEach(ListViewModel.filteredItems){weatherData in
                        WeatherCard(weatherCardViewModel: WeatherCardViewModel(weatherCardDetails: weatherData))
                                    .listRowBackground(Color.clear)
                                    .frame(width: 338, height: 185)
                                    .padding(.leading)
                    }
                    .onDelete (perform: ListViewModel.deleteWeatherRecord)
                            .deleteDisabled(true)
                    
                }.environment(\.editMode, $editMode)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
      
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Text(weather)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            ListViewModel.selectedItems = []
                            editMode = editMode == .active ? .inactive : .active
                        }, label: {
                            Image(systemName: "highlighter")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        })
                            
                            Menu {
                                Button(refresh, action: {
                                        ListViewModel.performRefresh()
                                        editMode = .inactive
                                    
                                })
                                Button(delete,action: {
                                        ListViewModel.deleteMultipleWeatherRecord()
                                        editMode = .inactive
                                })

                            } label: {
                                Image("dots")
                                    .foregroundColor(.white)
                            }
                        }

                }
            }
            .background(
                mainScreenBackgroundGradient)

        }
        
    }

    }

    struct MainScreen_Previews: PreviewProvider {
        static var previews: some View {
            MainScreen()
        }
    }
