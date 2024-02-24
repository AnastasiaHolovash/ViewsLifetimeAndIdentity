//
//  StructuralIdentityState.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 18.02.2024.
//

import SwiftUI

struct StructuralIdentityState: View {
    @State var isOn: Bool = false

    var body: some View {
        VStack {
            circle1
            circle2
            circle3

            Toggle("", isOn: $isOn)
                .frame(width: 100)

            let _ = print(type(of: circle1))
            let _ = print(type(of: circle2))
            let _ = print(type(of: circle3))
        }
        .animation(.easeIn, value: isOn)
    }

    var circle1: some View {
        HStack {
            CircleWithNumberView()
                .opacity(isOn ? 0.5 : 1)
                .offset(x: isOn ? 200 : 0)

            Spacer()
        }
    }

    var circle2: some View {
        HStack {
            CircleWithNumberView()
                .applyIf(condition: isOn) { view in
                    view
                        .opacity(0.5)
                        .offset(x: 200)
                }

            Spacer()
        }
    }

    var circle3: some View {
        HStack {
            if isOn {
                CircleWithNumberView()
                    .opacity(0.5)
                    .offset(x: 200)
            } else {
                CircleWithNumberView()
            }

            Spacer()
        }
    }

}

#Preview {
    StructuralIdentityState()
}
