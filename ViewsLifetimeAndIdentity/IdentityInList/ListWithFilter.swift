//
//  ListWithFilter.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 21.02.2024.
//

import SwiftUI

struct ListWithFilter: View {

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
            ForEach(data.filter { $0.index.isMultiple(of: 2) } ) { element in
                Text(element.id)
            }
        }
    }
}

#Preview {
    ListWithFilter()
}
