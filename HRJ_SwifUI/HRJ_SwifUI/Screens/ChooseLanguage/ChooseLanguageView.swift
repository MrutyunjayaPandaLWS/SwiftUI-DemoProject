//
//  ContentView.swift
//  HRJ_SwifUI
//
//  Created by admin on 29/07/25.
//
import Foundation
import SwiftUI

struct ChooseLanguageView: View {
    @State private var selectedLanguage: String? = "English"
    @State private var navigateToNext = false
    var body: some View {
        ZStack{
            Color(AppColor.viewBGColor ?? UIColor.white)
                        .ignoresSafeArea()
        NavigationView{
            VStack(spacing: 0 ){
                Image("JOHNSON_LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                
                Divider()
                Spacer()
                //                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    VStack(alignment: .leading){
                        Text("Select")
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("APP LANGUAGE")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                    }
                    
                    HStack(spacing: 34) {
                        LanguageButton(
                            text: "En",
                            selectedLanguage: "English",
                            isSelected: selectedLanguage == "English") {
                                selectedLanguage = "English"
                            }
                        
                        LanguageButton(
                            text: "हिं",
                            selectedLanguage: "हिंदी",
                            isSelected: selectedLanguage == "हिंदी") {
                                selectedLanguage = "हिंदी"
                            }
                        
                    }
                    
                    HStack(spacing: 34) {
                        LanguageButton(
                            text: "த",
                            selectedLanguage: "தமிழ்",
                            isSelected: selectedLanguage == "தமிழ்") {
                                selectedLanguage = "தமிழ்"
                            }
                        
                        LanguageButton(
                            text: "తె",
                            selectedLanguage: "తెలుగు",
                            isSelected: selectedLanguage == "తెలుగు") {
                                selectedLanguage = "తెలుగు"
                            }
                        LanguageButton(
                            text: "മ",
                            selectedLanguage: "മലയാളം",
                            isSelected: selectedLanguage == "മലയാളം") {
                                selectedLanguage = "മലയാളം"
                            }
                    }
                    
                    HStack(spacing: 34) {
                        LanguageButton(
                            text: "বাং",
                            selectedLanguage: "বাংলা",
                            isSelected: selectedLanguage == "বাংলা") {
                                selectedLanguage = "বাংলা"
                            }
                        
                        LanguageButton(
                            text: "ଓ",
                            selectedLanguage: "ଓଡିଆ",
                            isSelected: selectedLanguage == "ଓଡିଆ") {
                                selectedLanguage = "ଓଡିଆ"
                            }
                        LanguageButton(
                            text: "म",
                            selectedLanguage: "मराठी",
                            isSelected: selectedLanguage == "मराठी") {
                                selectedLanguage = "मराठी"
                            }
                    }
                }
                
                Spacer()
                Spacer()
                
                CustomTapNavButton(
                    text: "Done",
                    action:{
                        navigateToNext = true
                    })
                //                .padding(8)
                
                NavigationLink(
                    destination:
                        ChooseCustomerTypeView()
                        .navigationBarBackButtonHidden(true)
                    ,
                    isActive: $navigateToNext,
                    label: { EmptyView() }
                )
            }
            
        }
        .padding(15)
        .padding(.bottom, 10)
    }
    }
}


#Preview {
    NavigationView {
        ChooseLanguageView()
    }
    
}

