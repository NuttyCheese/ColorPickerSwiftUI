//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Борис Павлов on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var valueRed = Double.random(in: 0...255)
    @State private var valueGreen = Double.random(in: 0...255)
    @State private var valueBlue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        VStack {
            RectangleView(red: valueRed, green: valueGreen, blue: valueBlue)
            HStack {
                    SliderColor(value: $valueRed, trackColor: .red)
                    SliderColor(value: $valueGreen, trackColor: .green)
                    SliderColor(value: $valueBlue, trackColor: .blue)
            }
            
            .focused($focusedField)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
