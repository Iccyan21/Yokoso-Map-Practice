//
//  SettingView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/20.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack{
                        Text("Setting")
                            .font(.system(size: 50)) // ここでカスタムフォントサイズを指定
                            .fontWeight(.bold) // フォントの太さも調整可能
                        
                        Spacer()
                    }.padding()
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("How about")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text("Japan??")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Image("JapanFlag") // You can replace this with an actual image of Japan's flag
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            
                            .padding()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
                    .padding()
                    
                    List {
                        
                        Section {
                            HStack {
                                NavigationLink(destination: Text("Gift Engineer!!")) {
                                    Image(systemName: "gift.fill")
                                        .foregroundColor(.primary)
                         
                                        .font(.system(size: 20))
                                    Text("Gift Engineer!")
                                        .foregroundColor(.primary)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    Spacer()
                                }
                            }
                            Button(action: {
                                let email = "iccyan0429@gmail.com"
                                let subject = "ご意見・ご要望"
                                let body = "ご意見・ご要望など、お気軽にお寄せください。"
                                let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                                let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                                let mailtoURL = URL(string: "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)")!
                                openURL(mailtoURL)
                            }, label: {
                                HStack{
                                    Image(systemName: "mail")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 20))
                                    Text("Opinions, Requests")
                                        .foregroundColor(.primary)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                }
                            })
                            
                            HStack {
                                NavigationLink(destination: Text("write a review")) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 20))
                                    
                                    Text("Write a review")
                                        .foregroundColor(.primary)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    
                                    Spacer()
                                }
                            }
                            
                            NavigationLink(destination: TermsView()) {
                                Image(systemName: "exclamationmark.lock")
                                    .foregroundColor(.primary)
                                    .font(.system(size: 20))
                                
                                Text("Terms of service")
                                    .foregroundColor(.primary)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                            }
                            
                            NavigationLink(
                                destination: PrivacyPolicyView(),
                                label: {
                                    Image(systemName: "hand.raised")
                                        .foregroundColor(.primary)
                                        .font(.system(size: 20))
                                    
                                    Text("Privacy policy").foregroundColor(.primary)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                })
                        } header: {
                            Text("General")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                    } // List
                    .scrollContentBackground(.hidden)
                    .background(Color.white)
                }
                
                Spacer()
                
           
            }
            .navigationBarTitleDisplayMode(.inline)
            .scrollDisabled(true)
            // .toolbarBackground(Color.darkGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarTitleDisplayMode(.inline)
   
        }
    }
}

#Preview {
    SettingView()
}
