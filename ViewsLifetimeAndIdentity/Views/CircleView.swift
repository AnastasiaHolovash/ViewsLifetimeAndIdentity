//
//  CircleView.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 20.02.2024.
//

import SwiftUI

struct CircleData {
    let name: String
    let color: Color
}

struct CircleView: View {
    let data: CircleData

    var body: some View {
        Circle()
            .fill(data.color)
            .frame(width: 150, height: 150)
            .padding()
    }
}
