//
//  ValueTextField.swift
//  ColorPickerSwiftUI
//
//  Created by Борис Павлов on 07.07.2022.
//

import SwiftUI

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

struct ValueTextField_Previews: PreviewProvider {
    static var previews: some View {
        ValueTextField(textValue: .constant("100"), value: .constant(100))
    }
}
