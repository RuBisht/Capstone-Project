//
//  CustomSearchBar.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    
    var prompt: String
  
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(prompt, text: $searchText)
                .foregroundColor(.black) // Change text color here
                
        }
        .padding(8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

