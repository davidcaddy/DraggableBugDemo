//
//  ContentView.swift
//  DropTest
//
//  Created by David Caddy on 16/6/2024.
//

import SwiftUI

extension View {
    
    func dropTarget<T>(for payloadType: T.Type, withTitle title: String) -> some View where T: Transferable {
        modifier(DropTargetViewModifer<T>(title: title))
    }
}

struct DropTargetViewModifer<T>: ViewModifier where T: Transferable {
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .dropDestination(for: T.self) { items, location in
                print("Item(s) dropped in \(title)")
                return true
            } isTargeted: { targted in
                if targted {
                    print("\(title) targeted")
                }
            }
    }
}

struct InnerTestView: View {
    let title: String
    let borderColor: Color
    
    var body: some View {
        ZStack {
            Text(title)
                .padding()
            Rectangle()
                .stroke(borderColor)
        }
        .contentShape(Rectangle())
    }
}

struct TestView: View {
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack(alignment: .top, spacing: 0.0) {
                InnerTestView(title: "Drop Zone 1", borderColor: .pink)
                    .dropTarget(for: ItemType1.self, withTitle: "Drop Zone 1")
                
                InnerTestView(title: "Drop Zone 2", borderColor: .indigo)
                    .dropTarget(for: ItemType2.self, withTitle: "Drop Zone 2")
            }
            
            InnerTestView(title: "Drop Zone 3", borderColor: .orange)
                .dropTarget(for: ItemType3.self, withTitle: "Drop Zone 3")
        }
        .contentShape(Rectangle())
        .draggable(ItemType1(id: "Object 1"))
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                
                TestView()
                
                TestView()
                
                InnerTestView(title: "Draggable 2", borderColor: .orange)
                    .draggable(ItemType2(id: "Object 2"))
                
                InnerTestView(title: "Draggable 3", borderColor: .indigo)
                    .draggable(ItemType3(id: "Object 3"))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
