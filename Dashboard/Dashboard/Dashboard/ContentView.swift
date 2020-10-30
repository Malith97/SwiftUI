//
//  ContentView.swift
//  Dashboard
//
//  Created by Synn Labz on 10/9/20.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Dashboard()
                /*.preferredColorScheme(.light)
                .navigationTitle("")
                .navigationBarHidden(true)*/
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Dashboard : View {
    
    @State var index = 0
    @State var main : MainData!
    @State var daily : [Daily] = []
    @State var last : Int = 0
    @State var country = "usa"
    @State var alert = false
    
    var body: some View{
        
        VStack{
            
            if self.main != nil && !self.daily.isEmpty{
                
                VStack{
                    
                    VStack(spacing: 10){
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Sri Lanka")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("Let's stand against corona")
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                        }.padding(.horizontal,10)
                        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                        
                        
                        HStack(spacing: 15){
                            HStack{
                                VStack(alignment:.leading,spacing: 12){
                                    
                                    Text("Affected")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(self.main.cases)")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .foregroundColor(.white)
                                    
                                }.padding(.horizontal)
                                Spacer()
                                
                            }.padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("affected"))
                            .cornerRadius(12)
                            .shadow(radius: 15)
                            
                            
                            HStack{
                                VStack(alignment:.leading,spacing: 12){
                                    
                                    Text("Deaths")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(self.main.deaths)")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .foregroundColor(.white)
                                    
                                }.padding(.horizontal)
                                Spacer()
                                
                            }.padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("death"))
                            .cornerRadius(12)
                            .shadow(radius: 15)
                            
                        }
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        
                        HStack(spacing: 15){
                            
                            HStack(spacing: 12){
                                VStack(alignment:.leading){
                                    Text("Recovered")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(self.main.recovered)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }.padding(.horizontal)
                                Spacer()
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("recovered"))
                            .cornerRadius(12)
                            .shadow(radius: 15)
                            
                            HStack(spacing: 12){
                                VStack(alignment:.leading){
                                    Text("Active      ")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(self.main.active)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }.padding(.horizontal)
                                Spacer()
                                
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("active"))
                            .cornerRadius(12)
                            .shadow(radius: 15)
                            
                        }
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 35)
                    .background(Color("white"))
                    
                    Spacer()
                        .frame(height:5)
                    
                    HStack{
                        
                        Text("What we can do..")
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }.padding(.horizontal,25)
                    
                    VStack(alignment:.leading,spacing: 10){
                        
                        HStack(spacing: 12){
                            VStack(alignment:.leading){
                                Text("Wear a Mask")
                                    .fontWeight(.bold)
                                Spacer().frame(height:5)
                                Text("Cover your mouth and nose with your bent elbow or tissue when you cough or sneeze")
                                    .font(.system(size: 12, weight: .regular))
                            }.frame(width:200, height:110)
                            Spacer()
                                .frame(width:10)
                            Image("mask")
                                .resizable()
                                .frame(width:100,height:100)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 1) - 50,height:120)
                        .background(Color("white"))
                        .cornerRadius(12)
                        .shadow(radius: 15)
                        
                        HStack(spacing: 12){
                            Spacer()
                            Image("handwash")
                                .resizable()
                                .frame(width:100,height:100)
                            VStack(alignment:.leading){
                                Text("Did you wash your")
                                    .fontWeight(.medium)
                                
                                Text("Hands?")
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(.bottom,3)
                                
                                Text("Clean your hands with an alcohol-based hand rub or wash them with soap and water")
                                    .font(.system(size: 12, weight: .regular))
                            }.frame(width:200, height:110)
                            Spacer()
                                .frame(width:20)
                        }
                        .frame(width: (UIScreen.main.bounds.width / 1) - 50,height:120)
                        .background(Color("white"))
                        .cornerRadius(12)
                        .shadow(radius: 15)
                        .padding(.vertical)
                        
                        HStack(spacing: 12){
                            VStack(alignment:.leading){
                                Text("Social Distance")
                                    .fontWeight(.bold)
                                
                                Spacer().frame(height:5)
                                
                                Text("Maintain a 1-metre distance between yourself and others to reduce the risk")
                                    .font(.system(size: 12, weight: .regular))
                            }.frame(width:200, height:110)
                            Spacer()
                                .frame(width:10)
                            Image("distance")
                                .resizable()
                                .frame(width:100,height:60)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 1) - 50,height:120)
                        .background(Color("white"))
                        .cornerRadius(12)
                        .shadow(radius: 15)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .background(Color("white"))
                    .cornerRadius(20)
                    .padding(.vertical)
                }
            }
            else{
                
                /*Indicator()*/
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            
            self.getData()
        }
    }

    func getData(){
        
        var url = ""
        
        if self.index == 0{
            
            url = "https://corona.lmao.ninja/v2/countries/Sri%20Lanka?yesterday=false"
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSONDecoder().decode(MainData.self, from: data!)
            
            self.main = json
        }
        .resume()
        
        var url1 = ""
        
        if self.index == 0{
            
            url1 = "https://corona.lmao.ninja/v2/historical/Sri%20Lanka?lastdays=7"
        }
        else{
            
            url1 = "https://corona.lmao.ninja/v2/historical/Sri%20Lanka?lastdays=7"
        }
        
        let session1 = URLSession(configuration: .default)
        
        session1.dataTask(with: URL(string: url1)!) { (data, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            var count = 0
            var cases : [String : Int] = [:]
            
            if self.index == 0{
                
                let json = try! JSONDecoder().decode(MyCountry.self, from: data!)
                cases = json.timeline["cases"]!
            }
            
            for i in cases{
                
                self.daily.append(Daily(id: count, day: i.key, cases: i.value))
                count += 1
            }
            
            self.daily.sort { (t, t1) -> Bool in
//
                if t.day < t1.day{
                    
                    return true
                }
                else{
                    
                    return false
                }
            }
            
            self.last = self.daily.last!.cases
        }
        .resume()
    }
    
    func getHeight(value : Int,height:CGFloat)->CGFloat{
        
        // safer Side...
        
        if self.last != 0{
            
            let converted = CGFloat(value) / CGFloat(self.last)
            
            return converted * height
        }
        else{
            
            return 0
        }
    }

}

class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}


// Data Models For JSON Parsing....

struct Daily: Identifiable{
    
    var id : Int
    var day : String
    var cases : Int
}

struct MainData : Decodable{
    
    var deaths : Int
    var recovered : Int
    var active : Int
    var critical : Int
    var cases : Int
}

struct MyCountry : Decodable {
    
    var timeline : [String : [String : Int]]
}
/*
struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: Context) ->  UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView:  UIActivityIndicatorView, context: Context) {
        
        
    }
}*/

struct CustomCorners : Shape{
    var corners : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
         
        return Path(path.cgPath)
    }
}


