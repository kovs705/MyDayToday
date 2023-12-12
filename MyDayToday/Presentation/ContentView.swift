//
//  ContentView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var days: [Day]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    HStack {
                        Text("Hello, Eugene")
                            
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    Spacer()
                        .background(Color.blue)
                    
                    Text("Make your first note")
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(.black)
                                    .frame(alignment: .center)
                            )
                    })
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
            }
            .modifier(AppearModifier())
        }
        .background(Color.pineapple)
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Day(date: Date(), feelings: Int.random(in: 1...10), note: nil)
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(days[index])
            }
        }
    }
}

struct ContetViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//            List {
//                ForEach(days) { item in
//                    NavigationLink {
//                        Text("Item at \(item.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.date, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }

