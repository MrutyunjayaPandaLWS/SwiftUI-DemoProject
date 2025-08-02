//
//  CustomTextField.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct CustomTextField: View {
    let imageString: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                .background(Color.white)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .overlay(
                    HStack(spacing: 14) {
                        Image(systemName: imageString)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)

                        TextField(placeholder, text: $text)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                )
        }
    }
}

#Preview {
    CustomTextField(imageString: "phone", placeholder: "Email", text: .constant(""))
        .padding()
}
//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(imageString: "envelope", placeholder: "Email", text: .constant(""))
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
