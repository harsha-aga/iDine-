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
                            HStack {
                                Image(item.mainImage)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)
                                    .clipShape(Circle())
                                    .shadow(color: .purple,
                                            radius: 5)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 0,
                                                        bottom: 0,
                                                        trailing: 16))
                                Text(item.name).padding(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 16)).fixedSize()
                                MenuItemListView(item: item).frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.inset).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    ContentView()
}
