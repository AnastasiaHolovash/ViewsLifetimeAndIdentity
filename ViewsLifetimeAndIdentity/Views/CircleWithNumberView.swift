//
//  CircleWithNumberView.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 20.02.2024.
//

import SwiftUI

struct CircleWithNumberView: View {
    @State var count = 0

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 150, height: 150)

            Text(String(count))
                .foregroundStyle(.white)
        }
        .padding()
        .onTapGesture {
            count += 1
        }
    }
}
