//
//  List1.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

private let initialData: [String] = (0..<10000).map { _ in UUID().uuidString }

struct List1: View {

    @State var data: [String] = initialData

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

        badList
//        goodList
    }

    var badList: some View {
        List {
            ForEach(data.indices, id: \.self) { index in
                Text(data[index])
            }
        }
    }

    var goodList: some View {
        List {
            ForEach(data, id: \.self) { item in
                Text(item)
            }
        }
    }

    private func insertItem() {
        data.insert(UUID().uuidString, at: 2)
    }
}

#Preview {
    List1()
}
