//
//  LoginView.swift
//  EZheLi
//
//  Created by 陈驰坤 on 2021/6/28.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5.0)
                Text("E浙理")
                    .font(.title)
                    .fontWeight(.bold)
                VStack {
                    TextField("用户名", text: $username)
                    #if os(iOS)
                        .keyboardType(.asciiCapable)
                    #endif
                    Divider()
                    HStack {
                        if showPassword {
                            TextField("密码", text: $password)
                            #if os(iOS)
                                .keyboardType(.asciiCapable)
                            #endif
                        } else {
                        SecureField("密码", text: $password)
                        }
                        Button(action: {showPassword.toggle()}) {
                            Image(systemName: showPassword ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(height: 25)
                    
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(.gray, lineWidth: 1.0))
                let isCanLogin: Bool = Int(username) != nil && password.count > 0
                Button(action: {}) {
                    Text("登录...")
                        .font(.title2)
                }
                .disabled(!isCanLogin)
                .padding()
                NavigationLink("忘记密码？", destination: ForgetPasswordView())
                    .font(.footnote)
    //            Button(action: {}) {
    //                Text("忘记密码？")
    //                    .font(.footnote)
    //            }
                Spacer()
            }
            .padding([.leading, .trailing])
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .preferredColorScheme(.light)
        }
    }
}
