import SwiftUI
struct SelectedIDProofTypeButton<Destination: View>: View {
    
    let custImage: String
    let custType: String
    let destinationView: Destination
    let selectedType: String?
    let currentType: String
    var onTapAction: (() -> Void)? = nil

    @State private var isNavigationActive = false

    var body: some View {
        let isPressed = selectedType == currentType

        VStack {
            Button(action: {
                onTapAction?()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isNavigationActive = true
                }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isPressed ? Color(AppColor.LightPink ?? .red) : .white)
                    .stroke(Color(AppColor.deepDarkRedColor ?? .black), lineWidth: 0.5)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        HStack(spacing: 10) {
                            Image(custImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)

                            Text(currentType)
                                .font(.system(size: 15))
                                .foregroundStyle(.black)
                                .fontWeight(.medium)

                            Spacer()

                            ZStack {
                                Circle()
                                    .stroke(Color(AppColor.buttonColor ?? .red), lineWidth: 1)
                                    .frame(width: 20, height: 20)

                                if isPressed {
                                    Circle()
                                        .fill(Color(AppColor.buttonColor ?? .red))
                                        .frame(width: 10, height: 10)
                                }
                            }
                        }
                        .padding(10)
                    }
            }
            .buttonStyle(.plain)
            .shadow(radius: 0.4)

            NavigationLink(
                destination: destinationView,
                isActive: $isNavigationActive,
                label: { EmptyView() }
            )
        }
    }
}


struct SelectedIDProofTypeButton_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selectedType: String? = nil
        
        var body: some View {
            NavigationView {
                VStack(spacing: 20) {
                    SelectedIDProofTypeButton(
                        custImage: "Aadhaar", // Replace with your actual image asset
                        custType: "AADHAAR",
                        destinationView: Text("Navigated to AADHAAR View"),
                        selectedType: selectedType,
                        currentType: "AADHAAR",
                        onTapAction: {
                            selectedType = "AADHAAR"
                        }
                    )
                    
                    SelectedIDProofTypeButton(
                        custImage: "OtherProof", // Replace with your actual image asset
                        custType: "OTHERPROOFS",
                        destinationView: Text("Navigated to OTHERPROOFS View"),
                        selectedType: selectedType,
                        currentType: "OTHERPROOFS",
                        onTapAction: {
                            selectedType = "OTHERPROOFS"
                        }
                    )
                }
                .padding()
                .onAppear {
                    selectedType = nil
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
