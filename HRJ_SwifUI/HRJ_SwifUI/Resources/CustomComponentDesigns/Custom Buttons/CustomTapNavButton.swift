//
//  CustomTapButton.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct CustomTapNavButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(AppColor.buttonColor ?? .red),
                            Color(AppColor.deepDarkRedColor ?? .red)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
//                .padding(.horizontal, 8)
        )
    }
}


#Preview {
    CustomTapNavButton(text: "Generate OTP", action: {
        print("Generate OTP Button is taped")
    })
}
