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
                    NavigationLink("ScrollTo") {
                        ExplicitIdentityScrollTo()
                    }
                    NavigationLink("Index ID") {
                        ListIndexID()
                    }
                    NavigationLink("Computed UUID") {
                        ListComputedUUID()
                    }
                    NavigationLink("Computed ID") {
                        ListComputedID()
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
                Section("Check the Memory when open these examples") {
                    NavigationLink("List With Text") {
                        ListWithText()
                    }
                    NavigationLink("List With If") {
                        ListWithIf()
                    }
                    NavigationLink("List With If Else") {
                        ListWithIfElse()
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
