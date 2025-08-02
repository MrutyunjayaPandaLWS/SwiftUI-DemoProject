
import SwiftUI
struct ReferralCodeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var buttonTitle = "Verify"
    @State private var navigateToNext = false
    @State private var inputText = ""
    @State private var isClicked: String = ""
    
    var body: some View {
        ZStack{
            Color(AppColor.viewBGColor ?? UIColor.white)
                .ignoresSafeArea()
            NavigationView {
                VStack(spacing: 0) {
                    
                    VStack {
                        HStack {
                            Text("ENTER THE\nREFERRAL CODE")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                            Image("ReferralCode")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 15)
                        }
                        
                        Divider()
                   
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 40){
                        
                        VStack(alignment: .leading , spacing: 24){
                            
                            Text("Enter Referral Code")
                                .font(.system(size: 14, weight: .medium))
                            
                            TextField("Enter referral Code", text: $inputText)
                                .foregroundStyle(.black)
                                .font(.system(size: 24, weight: .medium))
                                .multilineTextAlignment(.center)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white)
                                        .stroke(.black, lineWidth: 0.5)
                                        .frame(height: 60)
                                )
                        }
                        
                        VStack(spacing: 20) {
                            
                            CustomTapNavButton(text: buttonTitle) {
                                isClicked = "Verify"
                                navigateToNext = true
                            }
                            
                            CustomTapNavButton_2(text: "Skip") {
                                isClicked = "Skip"
                                navigateToNext = true
                            }
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination:
                            RegisterView()
                            .navigationBarBackButtonHidden(true)
                        ,
                        isActive: $navigateToNext,
                        label: { EmptyView() }
                    )
                }
                .padding(15)
                .navigationBarItems(leading: Button(action: {
                    dismiss()
                }, label: {
                    Image("BackArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                }))
            }
        }
    }
}

#Preview {
    ReferralCodeView()
}

