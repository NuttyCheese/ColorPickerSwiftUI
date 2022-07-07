//
//  SliderColor.swift
//  ColorPickerSwiftUI
//
//  Created by Борис Павлов on 07.07.2022.
//

import SwiftUI

struct SliderColor: View {
    @State private var textValue = ""
    @Binding var value: Double
    
    let trackColor: Color
    
    var body: some View {
        
        VStack() {
            ValueTextField(textValue: $textValue, value: $value)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 2)
                        .foregroundColor(trackColor)
                )
            ValueText(valueText: "255", color: trackColor)
            Spacer()
            Slider(value: $value, in: 0...255, step: 1)
                .tint(trackColor)
                .onChange(of: value) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
                .rotationEffect(.degrees(-90))
            
            Spacer()
            ValueText(valueText: "0", color: .red)
            
        }
        .frame(height: 250)
        .onAppear {
            textValue = "\(lround(value))"
        }
    }
}

struct SliderColor_Previews: PreviewProvider {
    static var previews: some View {
        SliderColor(value: .constant(100), trackColor: .red)
    }
}
