//
//  CustomerType.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct CustomerTypeButton<Destination: View>: View {
    let custImage: String
    let custType: String
    let destinationView: Destination
    var body: some View {
        NavigationLink(destination: destinationView) {
                RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(Color(AppColor.deepDarkRedColor ?? .black),lineWidth: 0.5)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
//                    .shadow(radius: 0.4)
                    .overlay {
                        HStack(spacing: 10){
                            Image(custImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40,height: 40)
                                
                            Text(custType)
                                .font(.system(size: 15))
                                .foregroundStyle(.black)
                                .fontWeight(.medium)
                            Spacer()
                            Image("ForwardArrow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16)
                                .padding(.trailing, 10)
                                
                        }
                        .padding(10)
                    
                    }
                    
                
            
        }
        .shadow(radius: 0.4)
        
    }
}

#Preview {
    CustomerTypeButton(
        custImage:"Plumber",
        custType: "I am a Mason/Contractor", destinationView: EmptyView()
    )
}
