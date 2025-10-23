//
//  LoginView.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct Login_Or_Register_View: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Generate OTP"
    @State private var navigateToNext = false
    @State private var inputText = ""
    var isFrom: String
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
                        
                        VStack(alignment: .leading , spacing: 20){
                            
                            Text(isFrom == "LOGIN" ? "LOGIN" : "REGISTER" )
                                .foregroundStyle(.black)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                            
                            VStack(alignment: .leading) {
                                Text("Mobile Number")
                                    .font(.system(size: 16, weight: .medium))
                                
                                CustomTextField(
                                    imageString: "phone",
                                    placeholder: "Enter your mobile number",
                                    text: $inputText
                                )
                                
                                if buttonTitle == "Verify"{
                                    OTPView()
                                        .padding(.top, 10)
                                }
                                
                            }
                        }
                        
                        Spacer()
                        CustomTapNavButton(text: buttonTitle) {
                            if buttonTitle == "Generate OTP"{
                                buttonTitle = "Verify"
                            }else{
                                navigateToNext = true
                            }
                        }
                        if isFrom == "LOGIN" {
                            NavigationLink(
                                destination:
                                    DashboardView()
//                                    .navigationBarBackButtonHidden(true)
                                ,
                                isActive: $navigateToNext,
                                label: { EmptyView() }
                            )
                        } else {
                            NavigationLink(
                                destination:
                                    ReferralCodeView()
                                    .navigationBarBackButtonHidden(true),
                                isActive: $navigateToNext,
                                label: { EmptyView() }
                            )
                        }
                    }
                    .padding(.horizontal,15)
                }
                .navigationBarItems(leading: Button(action: {
                    dismiss()
                }, label: {
                    Image("BackArrow")
                }))
            }
        }
        .onChange(of: navigateToNext) { newValue in
            if !newValue {
                buttonTitle = "Generate OTP"
            }
        }
    }
}

#Preview {
    Login_Or_Register_View(isFrom: "LOGIN")
}


