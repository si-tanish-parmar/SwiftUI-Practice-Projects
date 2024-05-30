//
//  ContentView.swift
//  ListViewDemo
//
//  Created by Tanish Parmar on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [String] = [
        "apple","orange","banana","peach"
    ]
    
    @State var veggies: [String] = [
        "tomato","potato","carrot"
    ]
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Fruits")) {
                    ForEach(fruits, id: \.self){ fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: {indexSet in
                        delete(indexSet: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        move(indices: indices, newOffset: newOffset)
                    })
                }
                Section(header: Text("Veggies")){
                    ForEach(veggies, id: \.self){veggie in
                        Text(veggie.capitalized)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
        .accentColor(.red)
    }
    var addButton: some View{
        Button("Add",
               action: {
                   add()
        })
    }
    func delete(indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int){
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    func add(){
        fruits.append("Coconut")
    }
}

#Preview {
    ContentView()
}
