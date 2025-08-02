//
//  CustomTapButton_2.swift
//  HRJ_SwifUI
//
//  Created by admin on 31/07/25.
//

import SwiftUI

struct CustomTapNavButton_2: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.black)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(Color(AppColor.buttonColor ?? .red), lineWidth: 1)
//                .padding(.horizontal, 8)
        )
    }
}

#Preview {
    CustomTapNavButton_2(text: "Skip", action: {
        print("Skip Button is taped")
    })
}
