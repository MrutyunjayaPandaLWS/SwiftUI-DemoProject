//
//  RegisterView.swift
//  HRJ_SwifUI
//
//  Created by admin on 31/07/25.
//

import SwiftUI
struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Submit"
    @State private var navigateToNext = false
    @State private var mobileNumberText = ""
    @State private var nameText = ""
    @State private var emailText = ""
    @State private var addressText = ""
    @State private var stateText = ""
    @State private var cityText = ""
    @State private var pincodeText = ""
    @State private var preferredDealerNameText = ""
    
    var body: some View {
        // ZStack and its background color is removed to simplify the view hierarchy.
        // The background is now applied to the main VStack inside the NavigationView.
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                // Top section with LineDesign and a white background
                VStack {
                    LineDesign(isProgress: .personalDetails)
                        .padding(20)
                    Divider()
                }
                .padding(.top, 30)
                .background(.white)
                
                
                Text("REGISTER")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 15)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("Mobile Nubmer")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Enter Mobile Nubmer", text: $nameText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("Name")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Name", text: $nameText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Email")
                                .font(.system(size: 14, weight: .medium))
                            TextField("Email", text: $emailText)
                                .keyboardType(.emailAddress)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("Address")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Address", text: $addressText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                        }
                        
                        // MARK: - State Field as Button
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("State")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            
                            Button(action: {
                                print("State button clicked")
                            }) {
                                HStack {
                                    Text(stateText.isEmpty ? "Select State" : stateText)
                                        .foregroundColor(stateText.isEmpty ? .gray : .black)
                                    Spacer()
                                }
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                                .overlay(alignment: .trailing) {
                                    // Using a SF Symbol as a placeholder for the image
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color(AppColor.buttonColor ?? .red))
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        
                        // MARK: - City Field as Button
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("City")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            
                            Button(action: {
                                print("City button clicked")
                                
                            }) {
                                HStack {
                                    Text(cityText.isEmpty ? "Select City" : cityText)
                                        .foregroundColor(cityText.isEmpty ? .gray : .black)
                                    Spacer()
                                }
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                                .overlay(alignment: .trailing) {
                                    // Using a SF Symbol as a placeholder for the image
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color(AppColor.buttonColor ?? .red))
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Pincode")
                                .font(.system(size: 14, weight: .medium))
                            TextField("Pincode", text: $pincodeText)
                                .keyboardType(.numberPad)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                    
                                )
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("Preferred dealer Name")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Preferred dealer Name", text: $preferredDealerNameText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                    
                                )
                        }
                        
                        
                        CustomTapNavButton(text: buttonTitle) {
                            // Action for submitting registration details
                            print("Submit Registration Details Clicked")
                            navigateToNext = true // Navigate to the next step (e.g., UPI Details)
                        }
                        
                        NavigationLink(
                            destination: UPIDetailsView()
                                .navigationBarBackButtonHidden(true),
                            isActive: $navigateToNext,
                            label: { EmptyView() }
                        )
                    }
                    
                    
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 20)
                
            }
            // The main VStack now has the gray background, filling the entire NavigationView.
            .background(Color(AppColor.viewBGColor ?? .white))
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }, label: {
                // Using a SF Symbol as a placeholder for the image
                Image("BackArrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
            }))
            
        }
    }
}

#Preview {
    RegisterView()
}
