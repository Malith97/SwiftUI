//
//  ContentView.swift
//  travelapp
//
//  Created by Synn Labz on 10/15/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    @State var data = [
        Card(id:1,image: "srilanka",title:"Sri Lanka",details:"Srilanka is the best",expand:false),
        Card(id:2,image: "maldives",title:"Maldives",details:"Srilanka is the best",expand:false),
        Card(id:3,image: "australia",title:"Maldives",details:"Srilanka is the best",expand:false),
        Card(id:4,image: "newzealand",title:"Maldives",details:"Srilanka is the best",expand:false),
        Card(id:5,image: "england",title:"Maldives",details:"Srilanka is the best",expand:false),
    ]
    
    @State var hero = false
    var body: some View{
        VStack{
            ScrollView(.vertical, showsIndicators:false){
                VStack {
                    HStack{
                        VStack(alignment:.leading,spacing:8){
                            Text("Friday, October 2020")
                            Text("Today")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                        Image("propic")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }.padding()
                    
                    VStack(spacing:15){
                        ForEach(0..<self.data.count){
                            i in
                            GeometryReader { g in
                                ZStack {
                                    
                                    Image(self.data[i].image)
                                        .resizable()
                                        .cornerRadius(self.data[i].expand ? 0 : 25)
                                        .padding(.horizontal,self.data[i].expand ? 0 : 15)
                                        .offset(y: self.data[i].expand ? -g.frame(in:.global).minY:0)
                                        .onTapGesture{
                                            self.hero.toggle()
                                            self.data[i].expand.toggle()
                                        }
                                        
                                    HStack{
                                        VStack{
                                            Spacer()
                                            HStack {
                                                Image(systemName: "location")
                                                    .foregroundColor(.white)
                                                Text(self.data[i].title)
                                                    .foregroundColor(.white)
                                                    .font(.title3)
                                            }
                                        }
                                        Spacer()
                                    }.padding().padding(.horizontal)
                                }
                            }.frame(height:self.data[i].expand ? UIScreen.main.bounds.height : 250)
                        }
                    }
                }
            }
        }
    }
}

struct Card : Identifiable{
    var id : Int
    var image : String
    var title : String
    var details : String
    var expand : Bool
}
