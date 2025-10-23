//
//  SuccessView.swift
//  HRJ_SwifUI
//
//  Created by admin on 22/10/25.
//

import SwiftUI

// MARK: - SuccessView Page
struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Spacer()
            // Checkmark image placeholder - you can replace this with your own image asset
            VStack(spacing: 24) {
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.2)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
                    .padding()
                    .overlay{
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.green)
                    }
                
                Text("Success!")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.black)
                
                Text("Your UPI Details saved\nsuccessfully.")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                CustomButton(title: "Proceed", iconName: "arrow.right") {
                    print("Proceed button tapped")
                    // You can add navigation logic here, for example:
                    dismiss()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 20)
                
            }
            .background(Color.white)
            .cornerRadius(60, corners: [.topLeft, .topRight])
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                dismiss()
            }
        }.previewLayout(.sizeThatFits)
    }
}

// MARK: - Preview Provider
struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
