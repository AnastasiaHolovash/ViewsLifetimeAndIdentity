//
//  ListWithAnyView.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

struct ListWithAnyView: View {

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
                CellAnyView(element: element)
            }
        }
    }
}

struct CellAnyView: View {

    let element: Info

    var body: some View {
        AnyView(
            Text(element.id)
        )
    }

}

#Preview {
    ListWithAnyView()
}
