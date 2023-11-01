//
//  ContentView.swift
//  iDine
//
//  Created by Harsha Agarwal on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode(type: [MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { menuItem in
                    Section(menuItem.name) {
                        ForEach(menuItem.items) { item in
                            MenuItemListView(item: item)
                        }
                    }
                }
            }
                .navigationTitle("Menu")
                .listStyle(.inset).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

#Preview {
    ContentView()
}
