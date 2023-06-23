//
//  CustomEditButton.swift
//  CapstoneProject
//
//  Created by Rupali Bisht on 23/06/23.
//

import Foundation
import SwiftUI

struct CustomEditButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: "highlighter")
            .font(.system(size: 20))
            .foregroundColor(.white)
    }
}
