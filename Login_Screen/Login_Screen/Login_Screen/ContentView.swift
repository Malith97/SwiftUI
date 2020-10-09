//
//  ContentView.swift
//  Login_Screen
//
//  Created by Synn Labz on 10/5/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RegistrationScreen()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    var body: some View{
        VStack{
            Text("Welcome to Synn Labz")
        }
    }
}

struct SplashScreen : View{
    @State var isActive:Bool = false
    var body: some View{
        VStack{
            if self.isActive{
                LoginScreen()
            }else{
                ZStack{
                    Image("logo_dark")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                    
                    VStack(alignment:.center){
                        Spacer()
                        Text("Developed By Synn Labz")
                            .font(Font.system(size: 13,weight:.bold))
                            .padding(.bottom,15.0)
                            .multilineTextAlignment(.center)
                            .font(Font.body.bold())
                            .foregroundColor(Color.primary)
                    }.frame(maxWidth:.infinity , maxHeight: .infinity)
                }
            }
        }
        
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                withAnimation{
                    self.isActive = true
                }
            }
        }
        
    }
}

struct LoginScreen: View{
    @State var username: String = ""
    @State var password: String = ""
    var body: some View{
        VStack{
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Image("logo_light")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,30)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            
            Spacer(minLength: 0)
            
            HStack{
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please Sign in to continue")
                        .foregroundColor(Color.white.opacity(0.5))
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }.padding()
            
            HStack{
                Image(systemName: "envelope")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width:35,height: 25)
                TextField("Email", text: $username)
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack{
                Image(systemName: "lock")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width:35,height: 25)
                SecureField("Password", text: $username)
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            Button(action: {} , label: {
                Text("Login")
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .padding(.vertical)
                    .frame(width:UIScreen.main.bounds.width - 150)
                    .background(Color(.white))
                    .cornerRadius(15)
            }).padding(.top)
            
            Button(action: {} , label: {
                Text("Forget Password?")
                    .fontWeight(.regular)
                    .foregroundColor(Color.white.opacity(0.6))
                    .padding(.vertical)
                    .frame(width:UIScreen.main.bounds.width - 150)
            })
            
            Spacer(minLength: 0)
            
            HStack(spacing:5){
                Text("Don't Have an Account?")
                    .fontWeight(.regular)
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {} , label: {
                    Text("SignUp")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white.opacity(0.9))
                })
            }.padding(.vertical)
        }
        .background(Color("primarycolor").ignoresSafeArea(.all,edges: .all))
    }
}

struct RegistrationScreen: View{
    @State var username: String = ""
    @State var password: String = ""
    @State var email : String = ""
    var body: some View{
        VStack{
            Spacer()
            Image("logo_light")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,30)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            
            Spacer(minLength: 0)
            
            HStack{
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Registration")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please Fill the Below Fields")
                        .foregroundColor(Color.white.opacity(0.5))
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }.padding()
            
            HStack{
                Image(systemName: "person")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width:35,height: 25)
                TextField("Username", text: $username)
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack{
                Image(systemName: "envelope")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width:35,height: 25)
                TextField("Email", text: $email)
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack{
                Image(systemName: "lock")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width:35,height: 25)
                SecureField("Password", text: $username)
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            Button(action: {} , label: {
                Text("Register")
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .padding(.vertical)
                    .frame(width:UIScreen.main.bounds.width - 150)
                    .background(Color(.white))
                    .cornerRadius(15)
            }).padding(.top)
            
            Spacer(minLength: 0)
            
            HStack(spacing:5){
                Text("Already Have an Account?")
                    .fontWeight(.regular)
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {} , label: {
                    Text("SignIn")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white.opacity(0.9))
                })
            }.padding(.vertical)
        }
        .background(Color("primarycolor").ignoresSafeArea(.all,edges: .all))
    }
}
