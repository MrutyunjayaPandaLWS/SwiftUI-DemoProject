//
//  DashboardView.swift
//  HRJ_SwifUI
//
//  Created by admin on 31/07/25.
//

import SwiftUI

struct DashboardView: View {
    @State var pointBalace = "530"
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 180)
                    .cornerRadius(27, corners: [.bottomLeft,.bottomRight])
                    .overlay() {
                        HStack{
                            Button(action: {
                                // open side menu
                            }, label: {
                                Image("SideMenuIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                
                            })
                            Spacer()
                            HStack(spacing: 20){
                                Button(action: {
                                    // Display language View
                                }, label: {
                                    Image("LanguageIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 25)
                                    
                                })
                                Button(action: {
                                    // nav Notification View
                                }, label: {
                                    Image("Bell")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 25)
                                    
                                })
                            }
                        }.padding()
                        // MARK: - Red Card Positioned Below Header
                        VStack(spacing: 10) {
                            Spacer(minLength: 150) // pushes card below header curve
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(AppColor.buttonColor ?? .red),
                                            Color(AppColor.deepDarkRedColor ?? .red)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 300, height: 90)
                                .shadow(radius: 5)
                                .overlay(
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Point Balance")
                                                .font(.headline)
                                                .foregroundColor(.white.opacity(0.8))
                                            Text(pointBalace)
                                                .font(.system(size: 26, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                        Image("coinsIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(10)
                                            .shadow(radius: 4)
                                            .padding(.horizontal)
                                    }
                                        .padding()
                                )
                        }
                    }
            }.onAppear(perform: {
                self.pointBalace = pointBalace
            })
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10){
                    Image("defaultImg")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                }
                // MARK: - KYC Pending Box
                KYCProgressCard(progress: 0.3)
                // MARK: - Points Summary
                HStack(spacing: 16) {
                    StatusCard(title: "Total Points Redeemed", value: "220")
                    StatusCard(title: "Total Points Earned", value: "750")
                }
                .padding(.horizontal)
                // MARK: - Quick Actions Grid
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 4), spacing: 2) {
                    ActionTile(icon: "QRImageIcon", title: "Scan\nQR Code")
                    ActionTile(icon: "calulatorIcon", title: "Tiles\nCalculator")
                    ActionTile(icon: "findDealerIcon", title: "Find\nDealer")
                    ActionTile(icon: "leaderBoardIcon", title: "Plumber\nLeaderboard")
                }
                .padding(.bottom, 20)
                
            }.padding(.top, 40) // This is the padding from the red recatangle to the scrollView
            // MARK: - Bottom Tab Bar
            Divider()
            HStack(alignment: .center, spacing: 60 ) {
                TabItem(icon: "HrjIcon", title: "Home", selected: true)
                TabItem(icon: "giftBox", title: "Redeem")
                TabItem(icon: "walletIcon", title: "Earning")
                TabItem(icon: "QuestionMarkIcon", title: "Help")
            }
            .padding(.vertical, 6)
        }
        .ignoresSafeArea()
        Spacer()
    }
}

#Preview {
    DashboardView()
}

import SwiftUI

struct KYCProgressCard: View {
    var progress: Double // 0.0 to 1.0 (e.g., 0.3 = 30%)
    
    // MARK: - Dynamic Color Logic
    private var progressColor: Color {
        switch progress {
        case 0..<0.4: return .red          // 0–39%
        case 0.4..<0.7: return .orange     // 40–69%
        case 0.7..<0.9: return .yellow     // 70–89%
        default: return .green             // 90–100%
        }
    }
    
    var body: some View {
        HStack {
            // MARK: - Circular Progress Indicator
            ZStack {
                // Background Circle
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 5)
                
                // Progress Circle
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        progressColor,
                        style: StrokeStyle(lineWidth: 5, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 0.8), value: progress)
                
                // Percentage Text
                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .frame(width: 40, height: 40)
            
            // MARK: - Info Text
            VStack(alignment: .leading, spacing: 2) {
                Text("KYC and bank details are pending...")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Text("Click here to complete the process")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(progressColor.opacity(0.4), lineWidth: 2)
                .background(progressColor.opacity(0.1))
                .cornerRadius(10)
        )
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 20) {
        KYCProgressCard(progress: 0.3)  // 30% → 🔴 Red
        KYCProgressCard(progress: 0.5)  // 50% → 🟠 Orange
        KYCProgressCard(progress: 0.8)  // 80% → 🟡 Yellow
        KYCProgressCard(progress: 0.95) // 95% → 🟢 Green
    }
    .padding()
}

struct StatusCard: View{
    var title: String
    var value: String
    
    var body: some View{
        VStack(alignment: .leading,spacing: 4){
            Text(title)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            
            HStack {
                Image("coinStackIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(value)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    HStack(spacing: 16) {
        StatusCard(title: "Total Points Redeemed", value: "220")
        StatusCard(title: "Total Points Earned", value: "750")
    }
}

struct ActionTile: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack{
                Image("bottomDesignBGImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 100)
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
            }
            Text(title)
                .font(.system(size: 11))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct TabItem: View {
    var icon: String
    var title: String
    var selected: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(icon)
                .frame(width: 30, height: 30)
                .foregroundColor(selected ? .black : .gray)
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(selected ? .black : .gray)
        }
    }
}
