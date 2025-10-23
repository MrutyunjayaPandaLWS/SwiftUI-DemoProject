import SwiftUI
struct UPIDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Submit"
    @State private var navigateToNext = false
    @State private var nameText = ""
    @State private var upiIdText = ""
    @State private var showSuccessView = false
    
    var body: some View {
        ZStack {
            Color(AppColor.viewBGColor ?? .white)
                .ignoresSafeArea(.all)
            
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack {
                        LineDesign(isProgress: .UPIDetails)
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                        Divider()
                    }
                    .background(Color(AppColor.SolidWhite ?? .white))
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("UPI DETAILS")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundStyle(.black)
                            .padding(.top, 30)
                        
                        // MARK: - Account Holder Name
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("Account Holder Name")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Enter Holder Name", text: $nameText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                        }
                        
                        // MARK: - UPI ID
                        VStack(alignment: .leading, spacing: 14) {
                            HStack(spacing: 2) {
                                Text("UPI ID")
                                    .font(.system(size: 14, weight: .medium))
                                Text("*")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color(AppColor.buttonColor ?? .red))
                            }
                            TextField("Enter UPI ID", text: $upiIdText)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(height: 40)
                                        .background(.white)
                                )
                        }
                        
                        // MARK: - Attach Proof
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Attach Proof")
                                .font(.system(size: 14, weight: .medium))
                            
                            VStack(spacing: 8) {
                                HStack(spacing: 4) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12, height: 12)
                                    Text("Upload Image")
                                }
                                .foregroundColor(Color(AppColor.buttonColor ?? .red))
                                .font(.system(size: 12))
                                
                                Text("Note: Upload the QR code image with UPI ID")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 30)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    .foregroundColor(.gray)
                            )
                            .onTapGesture {
                                print("Upload Image Tapped")
                            }
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            CustomTapNavButton_2(text: "Skip") {
                                print("Skip UPI Details Clicked")
                                navigateToNext = true
                            }
                            
                            CustomTapNavButton(text: "Submit") {
                                print("Submit UPI Details Clicked")
                                self.showSuccessView = true
                            }
                        }
                        
                        .padding(.bottom, 20)
                    }
                    .padding(15)
                }
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
            Spacer()
            SuccessView()
                .presentationDetents([.medium])
                .presentationBackground(.ultraThinMaterial)
                .presentationCornerRadius(80)
        }
    }
}

// MARK: - Preview Provider
#Preview {
    UPIDetailsView()
}
