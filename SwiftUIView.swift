//
//  SwiftUIView.swift
//  iDine
//
//  Created by Harsha Agarwal on 01/11/23.
//

import SwiftUI

struct MenuItemListView: View {
    let item: MenuItem
    var body: some View {
        VStack {
            Image(item.mainImage).frame(width: 50, height: 50, alignment: .center).clipShape(Circle()).shadow(color: .purple, radius: 10)
            Text(item.name).font(.title2).padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            Text("$\(item.price)")
            HStack {
                let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction).font(.caption).fontWeight(.black).padding(5).background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    MenuItemListView(item: MenuItem(id: "1", name: "Fresh baked Croissant", photoCredit: "String", price: 100, restrictions: ["a"], description: "abcd"))
}
