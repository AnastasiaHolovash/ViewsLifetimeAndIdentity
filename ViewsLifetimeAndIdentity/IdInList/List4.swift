//
//  List4.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

class ViewModel4: ObservableObject {
    @Published var items: [ListItem4] = (0..<1000).map { _ in
        ListItem4(title: UUID().uuidString)
    }

    func insertItem() {
        items.insert(ListItem4(title: UUID().uuidString), at: 2)
    }

    func incrementCounter(index: Int) {
        items[index].counter += 1
    }
}

struct ListItem4: Identifiable, Hashable {
    var title: String
    var counter: Int = 0

    var id: Int { hashValue }
}

struct List4: View {

    @StateObject var viewModel = ViewModel4()

    var body: some View {
        HStack {
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

        list
    }

    var list: some View {
        List {
            ForEach(Array(zip(viewModel.items, viewModel.items.indices)), id: \.0.id) { item, index in
                ListItem4Cell(item: item)
                    .onTapGesture {
                        viewModel.incrementCounter(index: index)
                    }
            }
        }
    }
}

struct ListItem4Cell: View {
    let item: ListItem4

    @State var color = Color.random

    var body: some View {
        HStack {
            Spacer()
            Text(String(item.counter))
            Spacer()
        }
        .background(color)
    }
}

#Preview {
    List4()
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
