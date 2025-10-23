//
//  LoginView.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct ChooseLogin_or_Register_View: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color(AppColor.viewBGColor ?? UIColor.white)
                .ignoresSafeArea()
            NavigationView{
                VStack(spacing: 0){
                    
                    VStack {
                        Image("JOHNSON_LOGO")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                    }
                    .background(.white)
                    .frame(maxWidth: .infinity)
                
                    Divider()
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading,spacing: 20){
                        
                        VStack(alignment: .leading){
                            
                            Text("LOGIN/CREATE YOUR ACCOUNT")
                                .foregroundStyle(.black)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                        }
                        
                        VStack(spacing: 15){
                            
                            CustomerTypeButton(
                                custImage: "Login",
                                custType: "LOGIN",
                                destinationView:
                                    Login_Or_Register_View(isFrom: "LOGIN")
                                    .navigationBarBackButtonHidden(true)
                            )
                            
                            CustomerTypeButton(
                                custImage: "Register",
                                custType: "REGISTER",
                                destinationView:
                                    Login_Or_Register_View(isFrom: "REGISTER")
                                    .navigationBarBackButtonHidden(true)
                            )
                            
                        }
                        
                        Spacer()
                    }
                    .padding(15)
                }
                .navigationBarItems(
                    leading:
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image("BackArrow")
                        })
                )  
            }
        }
    }
}

#Preview {
    ChooseLogin_or_Register_View()
}
