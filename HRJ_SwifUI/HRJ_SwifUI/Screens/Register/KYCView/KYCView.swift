//
//  KYCView.swift
//  HRJ_SwifUI
//
//  Created by admin on 01/08/25.
//

import SwiftUI

struct KYCView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Submit"
    @State private var navigateToNext = false
    @State private var nameText = ""
    @State private var upiIdText = ""
    @State private var showSuccessView = false
    @State private var selectedType: String? = nil
    
    var body: some View {
        ZStack {
            Color(AppColor.viewBGColor ?? .white)
                .ignoresSafeArea(.all)
            
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack {
                        LineDesign(isProgress: .KYC)
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                        Divider()
                    }
                    .background(Color(AppColor.SolidWhite ?? .white))
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("SELECT ID PROOF TYPE")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundStyle(.black)
                            .padding(.top, 30)
                        
                        // MARK: - Account Holder Name
                        VStack(alignment: .leading, spacing: 14) {
//                       
                            SelectedIDProofTypeButton(
                                custImage: "Aadhaar",
                                custType: "AADHAAR",
                                destinationView: AadhaarDetailsView(), // Replace with your real View
                                selectedType: selectedType,
                                currentType: "AADHAAR",
                                onTapAction: {
                                    selectedType = "AADHAAR"
                                }
                            )

                            SelectedIDProofTypeButton(
                                custImage: "OtherProof",
                                custType: "OTHERPROOFS",
                                destinationView: OtherProofDetailsView(), // Replace with your real View
                                selectedType: selectedType,
                                currentType: "OTHERPROOFS",
                                onTapAction: {
                                    selectedType = "OTHERPROOFS"
                                }
                            )
                            
                        } .onAppear{
                            selectedType = nil
                        }
                       
                        Spacer()
                    }
                    .padding(15)
                    .navigationBarItems(leading: Button(action: {
                        dismiss()
                    }, label: {
                        Image("BackArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                    })
                    )
                    
                }
            }
            
            .sheet(isPresented: $showSuccessView) {
                SuccessView()
                    .presentationDetents([.medium])
                    .presentationBackground(.ultraThinMaterial)
                    .presentationCornerRadius(80)
            }
            
        }
       
    }
}

#Preview {
    KYCView()
}
