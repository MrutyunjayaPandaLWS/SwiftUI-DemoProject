//
//  LanguageButton.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct LanguageButton: View {
    let text: String
    let selectedLanguage: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action,
               label: {
            VStack{
                Circle()
                    .fill( isSelected ?  Color(AppColor.buttonBGColor ?? .white) : .white)
                    .stroke(Color(AppColor.buttonColor ?? .black), lineWidth: 2)
                    .frame(width: 80, height: 80)
                
                    .overlay {
                        Text(text)
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                Text(selectedLanguage)
                    .font(.title3)
                    .foregroundStyle(.black)
            }
        })
    }
}

#Preview {
    LanguageButton(text: "En", selectedLanguage: "English", isSelected: true, action: {
        print("language has choosen")
    })
}
