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

// MARK: - SuccessView Page
struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
                
//                Spacer()
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
            
           
    }
}

// MARK: - Preview Provider
struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
