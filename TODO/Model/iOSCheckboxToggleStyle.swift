//
//  iOSCheckboxToggleStyle.swift
//  TODO
//
//  Created by Charles He on 9/19/23.
//  source: https://sarunw.com/posts/swiftui-checkbox/

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()

        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}
