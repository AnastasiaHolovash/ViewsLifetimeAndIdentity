//
//  List3.swift
//  ViewsLifetimeAndIdentity
//
//  Created by Anastasia Holovash on 24.02.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var items: [ListItem3] = (0..<10000).map { _ in
        ListItem3(title: UUID().uuidString)
    }
}

struct ListItem3: Identifiable, Hashable {
    var title: String
    var counter: Int = 0

    var id: Int { hashValue }
}

struct List3: View {

    @StateObject var viewModel = ViewModel()
    @State var isFixed = false

    var body: some View {
        Toggle("Fix", isOn: $isFixed)
            .frame(width: 100)

        if isFixed {
            goodList
        } else {
            badList
        }
    }

    var badList: some View {
        List {
            ForEach($viewModel.items, id: \.id) { item in
                ListItem3Cell(item: item)

            }
        }
    }

    var goodList: some View {
        List {
            ForEach($viewModel.items, id: \.title) { item in
                ListItem3Cell(item: item)

            }
        }
    }
}

struct ListItem3Cell: View {
    @Binding var item: ListItem3
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
    List3()
}

