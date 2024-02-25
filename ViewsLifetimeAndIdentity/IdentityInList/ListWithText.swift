//
//  ListWithText.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 20.02.2024.
//

import SwiftUI

struct ListWithText: View {

    let data: [Info] = (0..<100_000).map { index in
        Info(id: UUID().uuidString, index: index)
    }

    var body: some View {
        list
    }

    var list: some View {
        List {
            ForEach(data, id: \.id) { element in
                Text(element.id)
            }
        }
    }
}

#Preview {
    ListWithText()
}


struct Info: Identifiable {
    let id: String
    let index: Int
}

