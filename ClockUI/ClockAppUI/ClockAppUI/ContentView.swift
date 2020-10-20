//
//  ContentView.swift
//  ClockAppUI
//
//  Created by Synn Labz on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    @State var isDark = false
    var body: some View {
        NavigationView{
            Clock(isDark: $isDark)
                .navigationBarHidden(true)
                .preferredColorScheme(isDark ? .dark : .light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Clock : View{
    
    @Binding var isDark : Bool
    var width = UIScreen.main.bounds.width
    @State var current_Time = Time(min: 0,sec: 0,hour: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    var body : some View{
        VStack {
            HStack {
                VStack(alignment:.leading){
                    Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(getDate())
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Button(action: {isDark.toggle()}){
                    Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                        .font(.system(size: 22))
                        .foregroundColor(isDark ? .black : .white)
                        .padding()
                        .background(Color.primary)
                        .clipShape(Circle())
                }
            }.padding()
            
            Spacer()
            
            ZStack{
                Circle()
                    .fill(Color("Color").opacity(0.1))
                    .shadow(radius: 50)
                
                ForEach(0..<60,id: \.self){i in
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 2, height: (i % 5) == 0 ? 15 : 5)
                        .offset(y:(width-150)/2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                    
                }
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width:2 , height:(width-180)/2)
                    .offset(y: -(width-180) / 4)
                    .rotationEffect(.init(degrees: Double(current_Time.sec)*6))
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width:4 , height:(width-200)/2)
                    .offset(y: -(width-200)/4)
                    .rotationEffect(.init(degrees: Double(current_Time.min)*6))
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width:4.5 , height:(width-240)/2)
                    .offset(y: -(width-240)/4)
                    .rotationEffect(.init(degrees: Double(current_Time.hour)*30))
                
                Circle()
                    .fill(Color.primary)
                    .frame(width:12,height:12)
                
            }.frame(width: width-180, height: width-180)
            
            Spacer()
            
            Text(getTime())
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            ZStack{
                Color.red.opacity(0.3)
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], size: 20))
                    .ignoresSafeArea(.all,edges: .bottom)
                    .frame(height:100)
                    .padding(.horizontal)
                    .padding(.bottom,0)
                    .padding(.top)
                
                HStack{
                    VStack(alignment:.leading){
                        Text("Melbourne")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Australia")
                    }
                    Spacer()
                    Text("1.25 AM")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal,35)
                .padding(.top)
            }
            
            ZStack{
                Color.orange.opacity(0.3)
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], size: 20))
                    .ignoresSafeArea(.all,edges: .bottom)
                    .frame(height:100)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top,0)
                HStack{
                    VStack(alignment:.leading){
                        Text("Auckland")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("New Zealand")
                    }
                    Spacer()
                    Text("2.35 PM")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal,35)
                .padding(.bottom)
            }
            
            
            
        }.onAppear(perform: {
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)){
                self.current_Time = Time(min: min, sec: sec, hour: hour)
            }
        })
        .onReceive(receiver){ (_) in
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)){
                self.current_Time = Time(min: min, sec: sec, hour: hour)
            }
        }
    }
    func getTime()->String{
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        return format.string(from: Date())
    }
    
    func getDate()->String{
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMM d, yyyy"
        return format.string(from: Date())
    }
}


struct Time {
    var min: Int
    var sec: Int
    var hour: Int
}

struct CustomCorners : Shape{
    var corners : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
         
        return Path(path.cgPath)
    }
}
