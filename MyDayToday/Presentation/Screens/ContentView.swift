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
                        
                        Group {
                            if !days.isEmpty {
                                LazyVStack(spacing: 10) {
                                    ForEach(days) { day in
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color(.basalt))
                                                .frame(height: 25)
                                            
                                            HStack {
                                                Text(day.feelings)
                                                    .font(.system(size: 40))
                                                
                                                Text(day.note)
                                                    .font(.system(size: 20))
                                                    .fontDesign(.rounded)
                                                    .foregroundStyle(.white)
                                            }
                                            
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 40)
                            } else {
                                LazyVStack(alignment: .center) {
                                    Text("No captures in the list")
                                }
                            }
                        }
                        
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
                MoodView(addCallback: { emoji, note in
                    showMoodView = false
                    addItem(with: !emoji.isEmpty ? emoji : "🫨", and: note)
                })
                .frame(width: geo.size.width, height: geo.size.height * 0.9)
            }
        }
    }
    
    
    
    private func presentMoodView() {
        showMoodView.toggle()
    }
    
    private func addItem(with emoji: String, and note: String) {
        withAnimation {
            let newItem = Day(date: Date(), feelings: emoji, note: note)
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

