//
//  SuccessView.swift
//  HRJ_SwifUI
//
//  Created by admin on 01/08/25.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let iconName: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                
                if let iconName = iconName {
                    Image(systemName: iconName)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(AppColor.buttonColor ?? .red),
                        Color(AppColor.deepDarkRedColor ?? .red)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(10)
        }
    }
}

