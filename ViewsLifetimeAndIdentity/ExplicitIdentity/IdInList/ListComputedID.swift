//
//  ListComputedID.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

class ListComputedIDViewModel: ObservableObject {
    @Published var items: [ListComputedIDItem] = (0..<10_000).map { _ in
        ListComputedIDItem(title: UUID().uuidString)
    }

    func insertItem() {
        items.insert(ListComputedIDItem(title: UUID().uuidString), at: 2)
    }
}

struct ListComputedIDItem: Identifiable, Hashable {
    let title: String
    var counter: Int = 0

    var id: Int { hashValue }
}

struct ListComputedID: View {

    @StateObject var viewModel = ListComputedIDViewModel()
    @State var isFixed = false

    var body: some View {
        HStack {
            Spacer()
            Toggle("Fix", isOn: $isFixed)
                .frame(width: 100)
            Spacer()

            Button(action: {
                withAnimation {
                    viewModel.insertItem()
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
            ForEach($viewModel.items, id: \.id) { item in
                ListComputedIDCell(item: item)

            }
        }
    }

    var goodList: some View {
        List {
            ForEach($viewModel.items, id: \.title) { item in
                ListComputedIDCell(item: item)

            }
        }
    }
}

struct ListComputedIDCell: View {
    @Binding var item: ListComputedIDItem
    @State var color = Color.random

    var body: some View {
        HStack {
            Spacer()
            Text(String(item.counter))
            Spacer()
        }
        .frame(height: 50)
        .listRowInsets(EdgeInsets())
        .onTapGesture {
            item.counter += 1
        }
        .background(color)
    }
}

#Preview {
    ListComputedID()
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
