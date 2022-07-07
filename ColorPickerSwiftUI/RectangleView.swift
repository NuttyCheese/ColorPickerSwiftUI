//
//  RectangleView.swift
//  ColorPickerSwiftUI
//
//  Created by Борис Павлов on 07.07.2022.
//

import SwiftUI

struct RectangleView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 160)
            .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255 ))
            .cornerRadius(30)
            .padding(.bottom)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(red: 100, green: 100, blue: 100)
    }
}
