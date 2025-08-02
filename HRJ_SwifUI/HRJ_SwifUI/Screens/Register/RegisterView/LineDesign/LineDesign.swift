import SwiftUI

struct LineDesign: View {
    
    let isProgress: IsProgress?
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack(spacing: 0) {
                // First Step: Personal Details
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 0) {
                        Text("1")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(6)
                            .background(
                                Circle()
                                    .fill(fillColor(for: .personalDetails))
                                    .stroke(strokeColor(for: .personalDetails), lineWidth: 1)
                            )
                            .foregroundColor(textColor(for: .personalDetails))
                        
                        Rectangle()
                            .fill(strokeColor(for: .UPIDetails))
                            .frame(width: 100, height: 2)
                    }
                    Text("Personal Details")
                        .font(.caption2)
                        .foregroundStyle(strokeColor(for: .personalDetails))
                        .padding(.leading, -26)
                }
                
                // Second Step: UPI Details
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 0) {
                        Text("2")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(6)
                            .background(
                                Circle()
                                    .fill(fillColor(for: .UPIDetails))
                                    .stroke(strokeColor(for: .UPIDetails), lineWidth: 1)
                            )
                            .foregroundColor(textColor(for: .UPIDetails))
                        
                        Rectangle()
                            .fill(strokeColor(for: .KYC))
                            .frame(width: 90, height: 2)
                    }
                    Text("UPI Details")
                        .font(.caption2)
                        .foregroundStyle(strokeColor(for: .UPIDetails))
                        .padding(.leading, -14)
                }
                
                // Third Step: KYC
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 0) {
                        Text("3")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(6)
                            .background(
                                Circle()
                                    .fill(fillColor(for: .KYC))
                                    .stroke(strokeColor(for: .KYC), lineWidth: 1)
                            )
                            .foregroundColor(textColor(for: .KYC))
                    }
                    Text("KYC")
                        .font(.caption2)
                        .foregroundStyle(strokeColor(for: .KYC))
                        .padding(.leading, 2)
                }
            }
            Spacer()
        }
        .padding(-40)
    }
    
    // Custom Red color
    private var customButtonColor: Color {
        Color(AppColor.buttonColor ?? .red)
    }

    // Determine if a step is a previous or current step
    private func isStepCompleted(_ step: IsProgress?) -> Bool {
        switch isProgress {
        case .personalDetails:
            return step == .personalDetails
        case .UPIDetails:
            return step == .personalDetails || step == .UPIDetails
        case .KYC:
            return true
        default:
            return false
        }
    }
    
    // Returns the stroke color
    private func strokeColor(for step: IsProgress) -> Color {
        isStepCompleted(step) ? customButtonColor : .gray
    }
    
    // Returns the circle fill color
    private func fillColor(for step: IsProgress) -> Color {
        isStepCompleted(step) ? customButtonColor : .white
    }
    
    // Returns the text color for the step number
    private func textColor(for step: IsProgress) -> Color {
        isStepCompleted(step) ? .white : .gray
    }
}

#Preview {
    LineDesign(isProgress: .personalDetails )
        .padding(15)
}

enum IsProgress: CaseIterable, Comparable {
    case personalDetails
    case UPIDetails
    case KYC
}
