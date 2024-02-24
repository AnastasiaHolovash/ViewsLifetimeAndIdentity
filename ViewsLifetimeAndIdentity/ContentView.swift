//
//  ContentView.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("ExplicitIdentity") {
                    NavigationLink("Explicit Identity ScrollTo") {
                        ExplicitIdentityScrollTo()
                    }
                    NavigationLink("List1") {
                        List1()
                    }
                    NavigationLink("List2") {
                        List2()
                    }
                    NavigationLink("List3") {
                        List3()
                    }
                    NavigationLink("List4") {
                        List4()
                    }
                }
                Section("Structural Identity") {
                    NavigationLink("Structural Identity Animation") {
                        StructuralIdentityAnimation()
                    }
                    NavigationLink("Structural Identity State") {
                        StructuralIdentityState()
                    }
                }
                Section("Identity In List") {
                    NavigationLink("List With Text") {
                        ListWithText()
                    }
                    NavigationLink("List With If 1") {
                        ListWithIf_1()
                    }
                    NavigationLink("List With Filter") {
                        ListWithFilter()
                    }
                    NavigationLink("List With If 2") {
                        ListWithIf_2()
                    }
                    NavigationLink("List With Nested If") {
                        ListWithNestedIf()
                    }
                    NavigationLink("List With AnyView") {
                        ListWithAnyView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
