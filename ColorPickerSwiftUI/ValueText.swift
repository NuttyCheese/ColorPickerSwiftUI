//
//  ValueText.swift
//  ColorPickerSwiftUI
//
//  Created by Борис Павлов on 07.07.2022.
//

import SwiftUI

struct ValueText: View {
    let valueText: String
    let color: Color
    
    var body: some View {
        Text(valueText)
            .foregroundColor(color)
    }
}

struct ValueText_Previews: PreviewProvider {
    static var previews: some View {
        ValueText(valueText: "120", color: .red)
    }
}
