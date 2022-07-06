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
    
    @State private var valueRedTextField = ""
    @State private var valueGreenTextField = ""
    @State private var valueBlueTextField = ""
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        VStack {
            RectangleView(red: valueRed, green: valueGreen, blue: valueBlue)
            HStack {
                VStack {
                    SliderColor(value: $valueRed, trackColor: .red)
                }
                VStack {
                    SliderColor(value: $valueGreen, trackColor: .green)
                }
                VStack {
                    SliderColor(value: $valueBlue, trackColor: .blue)
                }
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

struct ValueText: View {
    let valueText: String
    let color: Color
    
    var body: some View {
        Text(valueText)
            .foregroundColor(color)
            .padding(.bottom)
            .padding(.bottom)
            .padding(.bottom)
    }
}

struct ValueTextField: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkValue()
            }
        }
        .frame(width: 60)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("No correct format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
    }
}

struct SliderColor: View {
    @State private var textValue = ""
    @Binding var value: Double
    
    let trackColor: Color
    
    var body: some View {
        
        VStack {
            ValueTextField(textValue: $textValue, value: $value)
            ValueText(valueText: "255", color: .red)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(trackColor)
                .onChange(of: value) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
                .rotationEffect(.degrees(-90))
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
            ValueText(valueText: "0", color: .red)
            
        }
        .onAppear {
            textValue = "\(lround(value))"
        }
    }
}






