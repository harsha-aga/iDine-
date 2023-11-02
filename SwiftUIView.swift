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
        HStack {
            Text("$\(item.price)").padding(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 16))
        }
    }
}

#Preview {
    MenuItemListView(item: MenuItem(id: "1", name: "Fresh baked Croissant", photoCredit: "String", price: 100, restrictions: ["abc"], description: "abcd"))
}
