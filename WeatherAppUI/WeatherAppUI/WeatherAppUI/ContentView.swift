//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by Synn Labz on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DashboardScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DashboardScreen : View{
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var dailyData = [
        Daily(condition: "sun.max.fill", day: "MON"),
        Daily(condition: "cloud.fill", day: "TUE"),
        Daily(condition: "smoke.fill", day: "WED"),
        Daily(condition: "cloud.moon.fill", day: "THU"),
        Daily(condition: "cloud.sun.fill", day: "FRI")
    ]
    var body : some View{
        ZStack{
            VStack{
                HStack{
                    Image(systemName: "text.alignleft")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    Text("Weather App")
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                }.padding().padding(.horizontal).padding(.bottom,100)
                
                Spacer()
                
                VStack{
                    Text("Colombo")
                        .font(.system(size: 60, weight: .medium))
                        .foregroundColor(.white)
                    Text("Sunday, October 21 , 2020")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color.white.opacity(0.8))
                }.padding(.bottom,50)
                
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Text("26°C")
                        .font(.system(size: 85, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom,50)
                    
                    Image(systemName: "cloud.sun.fill")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.white.opacity(1))
                        .padding(.bottom)
                    Text("Sunny Day")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.8))
                    Text("25°C-29°C")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.8))
                    
                }.padding(.bottom,15)
                
                Spacer()
                
                GeometryReader { gr in
                    ZStack{
                        Spacer()
                        Color.gray.opacity(0.5)
                            .clipShape(CustomCorners(corners: [.topLeft,.topRight], size: 45))
                            .ignoresSafeArea(.all,edges: .bottom)
                            .frame(height:190)
                        
                        HStack(spacing:25){
                            ForEach(dailyData.indices,id: \.self){i in
                                VStack(alignment:.center){
                                    Image(systemName:dailyData[i].condition)
                                        .font(.system(size: 30, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(height:40)
                                        .padding(.bottom,13)
                                    Text(dailyData[i].day)
                                        .font(.system(size: 22, weight: .medium))
                                        .foregroundColor(.white)
                                }.padding(.bottom,25)
                            }
                        }
                    }.frame(width: width, height: height*0.25, alignment: .bottom)
                }
            }
        }.background(Image("mountainvalley").opacity(1).ignoresSafeArea())
    }
}

struct Daily : Identifiable{
    var id = UUID().uuidString
    var condition : String
    var day : String
}

struct CustomCorners : Shape{
    var corners : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
         
        return Path(path.cgPath)
    }
}
