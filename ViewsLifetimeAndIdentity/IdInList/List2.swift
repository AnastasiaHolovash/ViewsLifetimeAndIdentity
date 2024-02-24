//
//  List2.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

struct ListItem: Identifiable {
    let title: String

    var id: UUID { UUID() }
}

private let initialData: [ListItem] = (0..<10000).map { _ in
    ListItem(title: UUID().uuidString)
}

struct List2: View {

    @State var data: [ListItem] = initialData

    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                withAnimation {
                    insertItem()
                }
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(16)
            })
        }

        list
    }

    var list: some View {
        List {
            ForEach(data, id: \.id) { item in
                Text(item.title)
            }
        }
    }

    private func insertItem() {
        data.insert(ListItem(title: UUID().uuidString), at: 2)
    }
}

#Preview {
    List2()
}
