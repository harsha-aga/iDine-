//
//  ContentView.swift
//  iDine
//
//  Created by Harsha Agarwal on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode(type: [MenuSection].self, from: "menu.json")
    @State private var isList = true
    var body: some View {
        NavigationStack {
            DisplayView(isList: isList, menu: menu)
            .navigationTitle("Menu")
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Toggle("List", isOn: $isList).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                }
            }.navigationDe
        }
    }
}

#Preview {
    ContentView()
}

struct HorizontalView: View {
    let item: MenuItem
    var body: some View {
        VStack {
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
                Text("$\(item.price)").padding(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 16)).frame(maxWidth: .infinity, alignment: .trailing)
            }
            HStack {
                let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)

                }
            }.frame(maxWidth: .infinity ,alignment: .trailing)
        }
    }
}

struct ExtractedView: View {
    var menu: [MenuSection]
    var body: some View {
        List {
            ForEach(menu) { menuItem in
                Section(header: Text(menuItem.name).font(.title2)) {
                    ForEach(menuItem.items) { item in
                        HorizontalView(item: item)
                    }
                }.listRowSeparator(.hidden)
            }
        }
    }
}

struct HorizontalExtractedView: View {
    var menu: [MenuSection]
    var body: some View {
        List {
            ForEach(menu) { menuItem in
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(menuItem.items) { item in
                                MenuItemListView(item: item)
                                    .frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                    }
                } header: {
                    Text(menuItem.name).font(.title2)
                    Spacer()
                }.listRowSeparator(.hidden)
                
            }
        }
    }
}

struct DisplayView: View {
    var isList: Bool
    var menu: [MenuSection]
    var body: some View {
        if isList {
            ExtractedView(menu: menu)
        } else {
            HorizontalExtractedView(menu: menu)
        }
    }
}
