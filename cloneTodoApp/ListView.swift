//
//  ContentView.swift
//  cloneTodoApp
//
//  Created by MAYDAY on 2/11/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .environmentObject(listViewModel)
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
                .navigationTitle("Todo List")
                .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView(listViewModel: listViewModel)))
            }
        }
        
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
