//
//  ChooseCustomerTypeView.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct ChooseCustomerTypeView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color(AppColor.viewBGColor ?? UIColor.white)
                .ignoresSafeArea()
            
            NavigationView{
                
                VStack(spacing: 0){
                    
                    Image("JOHNSON_LOGO")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    
                    Divider()
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading,spacing: 20){
                        
                        VStack(alignment: .leading){
                            
                            Text("Select your")
                                .font(.system(size: 16, weight: .medium))
                                .font(.title)
                            
                            Text("CUSTOMER TYPE")
                                .foregroundStyle(.black)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                        }
                        
                        VStack(spacing: 15){
                            
                            CustomerTypeButton(
                                custImage: "Plumber",
                                custType: "I am a Plumber",
                                destinationView:
                                    ChooseLogin_or_Register_View()
                                    .navigationBarBackButtonHidden(true)
                            )
                            
                            CustomerTypeButton(
                                custImage: "CSM",
                                custType: "I am a CSM",
                                destinationView:
                                    ChooseLogin_or_Register_View()
                                    .navigationBarBackButtonHidden(true)
                            )
                            
                            CustomerTypeButton(
                                custImage: "Mason",
                                custType: "I am a Mason/Contractor",
                                destinationView:
                                    ChooseLogin_or_Register_View()
                                    .navigationBarBackButtonHidden(true)
                            )
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                }
                .navigationBarItems(leading: Button(action: {
                    dismiss()
                }, label: {
                    Image("BackArrow")
                }))
            }
        }
    }
}

#Preview {
    ChooseCustomerTypeView()
}
