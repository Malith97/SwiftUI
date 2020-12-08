//
//  ContentView.swift
//  CustomApp
//
//  Created by Synn Labz on 12/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabView : View{
    @State var selectedTab = "Home"
    var body : some View{
        VStack{
            Home()
            HStack(spacing:0){
                ForEach(tabs,id: \.self){image in
                    TabButton(image: image,selectedTab: $selectedTab)
                    
                    if image != tabs.last{
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                }
            }.padding(.horizontal,25)
            .padding(.vertical,5)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .edgesIgnoringSafeArea(.bottom)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

var tabs = ["house.fill","bolt.fill","cart.fill","bag.fill","person.fill"]

struct TabButton : View{
    
    var image : String
    @Binding var selectedTab : String
    
    var body : some View{
        Button(action: {selectedTab = image}){
            Image(systemName: image)
                .renderingMode(.template)
                .font(.system(size: 25))
                .foregroundColor(selectedTab == image ? Color(.gray) : Color.black.opacity(0.4))
                .padding([.bottom,.top])
        }
    }
}

struct Home : View{
    @State var txt = ""
    var body : some View{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Hello Malith")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("More you shop , more you win")
                }.foregroundColor(.black)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Button(action: {}){
                    Image("designer4pro")
                        .resizable()
                        .frame(width:50,height: 50)
                }
            }.padding()
            
            ScrollView(.vertical, showsIndicators:false){
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search Courses" , text: $txt)
                    }.padding(.vertical,12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                    HStack{
                        Text("Categories")
                            .font(.title3)
                            .fontWeight(.medium)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        Button(action: {}){
                            Text("View All")
                        }
                    }.padding(.top,20)
                    .foregroundColor(.black)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20),count:2),spacing:20){
                        
                        ForEach(courses){course in
                            CourseCardView(course: course)
                        }
                    }.padding(.top)
                    
                }.padding()
            }
            
        }.background(Color.black.opacity(0.05).ignoresSafeArea(.all,edges: .all))
    }
}

struct CourseCardView : View{
    var course : Course
    var body : some View{
        VStack{
            Image(course.asset)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .padding(.top,8)
                .padding(.leading,8)
                .background(Color.white)
            
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    Text(course.name)
                        .fontWeight(.bold)
                    
                    Text("\(course.numCourse) LKR")
                }.foregroundColor(.black)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }.padding()
        }.background(Color.white)
        .cornerRadius(15)
    }
}

struct Course : Identifiable{
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

var courses = [
    Course(name: "Mi Watch", numCourse: 24000, asset: "watch"),
    Course(name: "Macbook Pro", numCourse: 340000, asset: "macbook"),
    Course(name: "Nike Air", numCourse: 32000, asset: "shoes"),
    Course(name: "JBL Headphone", numCourse: 18000, asset: "headphones"),
    Course(name: "Logitech Keys", numCourse: 22000, asset: "keyboard"),
    Course(name: "Oneplus 8", numCourse: 145000, asset: "phone")
]
