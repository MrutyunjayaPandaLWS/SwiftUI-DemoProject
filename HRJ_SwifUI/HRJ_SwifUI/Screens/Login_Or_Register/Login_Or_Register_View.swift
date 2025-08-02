//
//  LoginView.swift
//  HRJ_SwifUI
//
//  Created by admin on 30/07/25.
//

import SwiftUI

struct Login_Or_Register_View: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Generate OTP"
    @State private var navigateToNext = false
    @State private var inputText = ""
    var isFrom: String
    var body: some View {
        ZStack{
            Color(AppColor.viewBGColor ?? UIColor.white)
                .ignoresSafeArea()
            NavigationView{
                VStack(spacing: 0){
                    
                    Image("JOHNSON_LOGO")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    
                    Divider()
                    
                    Spacer(minLength: 30)
                    
                    VStack(alignment: .leading,spacing: 20){
                        
                        VStack(alignment: .leading , spacing: 20){
                            
                            Text(isFrom == "LOGIN" ? "LOGIN" : "REGISTER" )
                                .foregroundStyle(.black)
                                .font(.system(size: 20))
                                .fontWeight(.heavy)
                            
                            VStack(alignment: .leading) {
                                Text("Mobile Number")
                                    .font(.system(size: 16, weight: .medium))
                                
                                CustomTextField(
                                    imageString: "phone",
                                    placeholder: "Enter your mobile number",
                                    text: $inputText
                                )
                                
                                if buttonTitle == "Verify"{
                                    OTPView()
                                        .padding(.top, 10)
                                }
                                
                            }
                        }
                        
                        Spacer()
                        CustomTapNavButton(text: buttonTitle) {
                            if buttonTitle == "Generate OTP"{
                                buttonTitle = "Verify"
                            }else{
                                navigateToNext = true
                            }
                        }
                        if isFrom == "LOGIN" {
                            NavigationLink(
                                destination:
                                    DashboardView()
                                //                                .navigationBarBackButtonHidden(true)
                                ,
                                isActive: $navigateToNext,
                                label: { EmptyView() }
                            )
                        } else {
                            NavigationLink(
                                destination:
                                    ReferralCodeView()
                                    .navigationBarBackButtonHidden(true),
                                isActive: $navigateToNext,
                                label: { EmptyView() }
                            )
                        }
                    }
                    .padding(.horizontal,15)
                }
                .navigationBarItems(leading: Button(action: {
                    dismiss()
                }, label: {
                    Image("BackArrow")
                }))
            }
        }
        .onChange(of: navigateToNext) { newValue in
            if !newValue {
                buttonTitle = "Generate OTP"
            }
        }
    }
}

#Preview {
    Login_Or_Register_View(isFrom: "LOGIN")
}



struct OTPView: View {
    
    @State private var timerText = "00 : 00"
    @State private var otpDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    @State private var remainingSeconds: Int = 60
    @State private var timer: Timer?
    // Removed @State private var TCImage: String = "" as it's redundant
    @State private var isTCClicked: Bool = false
    
    var body: some View {
        // Changed alignment to .leading to match the parent's content alignment
        VStack(spacing: 10) {
            HStack {
                Text("Enter OTP")
                Spacer()
                Text(timerText)
            }
            .fontWeight(.bold)
            
            HStack(spacing: 9) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $otpDigits[index])
                        .focused($focusedField, equals: index)
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.white)
                                .strokeBorder(Color.black, lineWidth: 0.5)
                        )
                        .onChange(of: otpDigits[index]) { oldValue, newValue in
                            if newValue.count > 1 {
                                otpDigits[index] = String(newValue.last ?? Character(""))
                            }
                            
                            if !newValue.isEmpty {
                                if index < 5 {
                                    focusedField = index + 1
                                }
                            }
                            else if newValue.isEmpty && !oldValue.isEmpty {
                                if index > 0 {
                                    focusedField = index - 1
                                }
                            }
                        }
                }
            }
            
            HStack {
                Button {
                    print("Terms & Condition is clicked")
                    isTCClicked.toggle()
                } label: {
                    HStack(spacing: 6){
                        Image(systemName: isTCClicked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(AppColor.buttonColor ?? .red))
                            .background {
                                if !isTCClicked {
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(AppColor.buttonColor ?? .red), lineWidth: 1.2*0.8)
                                }
                            }
                        Text("Terms & Conditions")
                            .font(.system(size: 14, weight: .light))
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer() // Pushes the following button to the right
                
                Button("Resend OTP ?") {
                    print("Resend button is clicked.")
                    startTimer()
                    otpDigits = Array(repeating: "", count: 6)
                    focusedField = 0
                }
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.red)
            }
        }
        .onAppear {
            focusedField = 0
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        stopTimer()
        remainingSeconds = 60
        updateTimerText()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
                updateTimerText()
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTimerText() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerText = String(format: "%02d : %02d", minutes, seconds)
    }
}

#Preview {
    OTPView()
        .padding(15)
}
