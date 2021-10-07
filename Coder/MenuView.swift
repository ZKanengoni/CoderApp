//
//  MenuView.swift
//  Coder
//
//  Created by Zivai Kanengomi on 2021/08/17.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                Text("Settings")
                    .font(.caption)
                
//                Color.white
//                    .frame(width: 38, height: 6)
//                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
//                    .frame(width: 130, height: 6, alignment: .leading)
//                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
//                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
//                    .padding()
//                    .frame(width: 150, height: 24)
//                    .background(Color.black.opacity(0.1))
//                    .cornerRadius(12)
//
                MenuRow(title: "More", icon: "gear")
                MenuRow(title: "Delete", icon: "stop")
                MenuRow(title: "Logout", icon: "creditcard")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(y: -150)
            )
           

            }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
