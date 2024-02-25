//
//  ListIndexID.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

struct ListIndexID: View {

    private static let initialData: [String] = (0..<10_000).map { _ in UUID().uuidString }

    @State var data: [String] = initialData
    @State var isFixed = false

    var body: some View {
        HStack {
            Spacer()
            Toggle("Fix", isOn: $isFixed)
                .frame(width: 100)
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

        if isFixed {
            goodList
        } else {
            badList
        }
    }

    var badList: some View {
        List {
            ForEach(data.indices, id: \.self) { index in
                ListIndexIDCell(title: data[index])
            }
        }
    }

    var goodList: some View {
        List {
            ForEach(data, id: \.self) { title in
                ListIndexIDCell(title: title)
            }
        }
    }

    private func insertItem() {
        data.insert(UUID().uuidString, at: 2)
    }
}

struct ListIndexIDCell: View {
    let title: String
    @State var color = Color.random

    var body: some View {
        ZStack(alignment: .leading) {
            color
            Text(title)
        }
        .frame(height: 50)
        .listRowInsets(EdgeInsets())
    }
}

#Preview {
    ListIndexID()
}
