//
//  CustomSearchBar.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    let constants = Constants()
    
    var prompt: String
  
    var body: some View {
        HStack {
            Image(systemName: constants.magnifyingglass)
                .foregroundColor(.gray)
            
            TextField(prompt, text: $searchText)
                .foregroundColor(.white) 
                
        }
        .padding(8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

