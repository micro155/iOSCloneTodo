//
//  NoItemsView.swift
//  cloneTodoApp
//
//  Created by MAYDAY on 2/11/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person?")
                
                NavigationLink(destination: AddView(listViewModel: listViewModel)) {
                    Text("Add something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor).cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.3) : Color.accentColor.opacity(0.6), radius: animate ? 30 : 10, x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
        .navigationTitle("Title")
    }
}
