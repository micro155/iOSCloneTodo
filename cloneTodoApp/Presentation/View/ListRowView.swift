//
//  ListRowView.swift
//  cloneTodoApp
//
//  Created by MAYDAY on 2/11/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        var item1 = ItemModel(title: "test1", isCompleted: false)
        var item2 = ItemModel(title: "test2", isCompleted: true)
        return ListRowView(item: item1)
    }
}
