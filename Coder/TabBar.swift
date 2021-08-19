//
//  TabBar.swift
//  Coder
//
//  Created by Zivai Kanengomi on 2021/08/18.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages{
            TabView {
                Home().tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Home")
                }
                CourseList().tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Courses")
                }
            }
        }
        else{
            WalkthroughScreen()
        }
       
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
    
        
        ZStack{
           
        
            if currentPage == 1{
                ScreenView(image:  "Card4", title: "Coder is the best place to learn to code", detail: "", bgColor: Color("card1"))
                    .transition(.scale)
            }
            if currentPage == 2{
            
                ScreenView(image: "Card5", title: "Take the next step to improve your coding knowledge", detail: "", bgColor: Color("card2"))
                    .transition(.scale)
            }
            
            if currentPage == 3{
                
                ScreenView(image: "Card6", title: "Coder gives you the freedom to learn and/or improve your coding skill on the go.", detail: "", bgColor: Color("card3"))
                    .transition(.scale)
            }
            
        }
        .overlay(
        
            Button(action: {
               
                withAnimation(.easeInOut){
                    
               
                    if currentPage <= totalPages{
                        currentPage += 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
        
                    .overlay(
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                                
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                
                if currentPage == 1{
                    Text("Hello World!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                else{
             
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("Welcome to coder.")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

var totalPages = 3
