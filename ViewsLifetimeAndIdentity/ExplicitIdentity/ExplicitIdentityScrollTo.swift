//
//  ExplicitIdentityScrollTo.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 18.02.2024.
//

import SwiftUI

struct ExplicitIdentityScrollTo: View {
    let headerID = "header"

    let fruits = [
        CircleData(name: "yellow", color: .yellow),
        CircleData(name: "red", color: .red),
        CircleData(name: "blue", color: .blue),
        CircleData(name: "pink", color: .pink),
        CircleData(name: "black", color: .black),
        CircleData(name: "purple", color: .purple),
        CircleData(name: "brown", color: .brown),
        CircleData(name: "cyan", color: .cyan)
    ]

    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                Text("Header")
                    .id(headerID)

                ForEach(fruits, id: \.name) { data in
                    CircleView(data: data)
                }

                Button("Scroll to top") {
                    withAnimation {
                        proxy.scrollTo(headerID)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExplicitIdentityScrollTo()
}
