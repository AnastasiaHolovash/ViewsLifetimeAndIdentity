//
//  ListWithNestedIf.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 21.02.2024.
//

import SwiftUI

struct ListWithNestedIf: View {

    let data: [Info] = (0..<100000).map { index in
        Info(id: UUID().uuidString, index: index)
    }

    var body: some View {
        let view = list
        let _ = print(type(of: view))
        return view
    }

    var list: some View {
        List {
            ForEach(data, id: \.id) { element in
                Cell(element: element)
            }
        }
    }
}

struct Cell: View {

    let element: Info

    var body: some View {
        if element.index.isMultiple(of: 2) {
            Text(element.id)
        } else {
            Color.mint
        }
    }

}

#Preview {
    ListWithNestedIf()
}
