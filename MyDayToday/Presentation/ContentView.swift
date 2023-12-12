//
//  ContentView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var toggle = false
    @State private var showMoodView = false
    
    @Environment(\.modelContext) private var modelContext
    @Query private var days: [Day]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Hello, Eugene")
                                .fontDesign(.rounded)
                                .fontWeight(.light)
                                .font(.system(size: 38))
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        
                        Spacer()
                            .background(Color.blue)
                        Text("Make your first note")
                        Spacer()
                    }
                    .modifier(AppearModifier(onDissapearToggle: $toggle))
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showMoodView.toggle()
                        }
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(.black)
                                    .frame(width: 130, height: 45, alignment: .center)
                            )
                    })
                }
                
                
                DarkView(isDark: $showMoodView)
                
            }
            .present(isPresented: $showMoodView, type: .toast, position: .bottom, animation: .spring, autohideDuration: nil, closeOnTap: false, closeOnTapOutside: true) {
                MoodView()
                    .frame(width: geo.size.width, height: geo.size.height * 0.9)
            }
        }
    }
    
    private func presentMoodView() {
        showMoodView.toggle()
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

