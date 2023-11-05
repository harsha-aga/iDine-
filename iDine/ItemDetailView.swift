//
//  ItemDetailView.swift
//  iDine
//
//  Created by Harsha Agarwal on 03/11/23.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                    Text(item.photoCredit).foregroundStyle(.white).padding(10).background(.black).offset(x: -15, y: -10).frame(alignment: .bottomTrailing)
                }
                Text(item.description)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10 ))
                    .background(Color.yellow.opacity(0.3))
                Spacer()
            }
            .navigationTitle(item.name)
        }
    }
}

#Preview {
    ItemDetailView(item: MenuItem(id: "straight up oj", name: "Porridge Deluxe", photoCredit: "straight-up-ojrfrfrf", price: 1234, restrictions: ["V"], description: "abchghsgc gcygygcycgy cydgyceygye ydyefdtf edyf ashgdhe hegdhed qwgdyge hgedygedy yedyfe"))
}
