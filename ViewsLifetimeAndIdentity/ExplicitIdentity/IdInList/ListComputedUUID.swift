//
//  ListComputedUUID.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

extension ListComputedUUID {

    struct ListItem: Identifiable {
        let title: String

        var id: UUID { UUID() }
    }

}

struct ListComputedUUID: View {

    private static let initialData: [ListItem] = (0..<10_000).map { _ in
        ListItem(title: UUID().uuidString)
    }

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
            ForEach(data, id: \.id) { _ in
                ListComputedUUIDCell()
            }
        }
    }

    private func insertItem() {
        data.insert(ListItem(title: UUID().uuidString), at: 2)
    }
}

struct ListComputedUUIDCell: View {
    @State var color = Color.random

    var body: some View {
        color
            .frame(height: 50)
            .listRowInsets(EdgeInsets())
    }
}

#Preview {
    ListComputedUUID()
}
