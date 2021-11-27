//
//  QRCodeFake.swift
//  QRCodeFake
//
//  Created by 陈驰坤 on 2021/9/10.
//

import SwiftUI

struct QRCodeFake: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Rectangle()
                .frame(height: 82.0)
            .foregroundColor(Color("QRCodeViewColor"))
            .overlay(content: {
                HStack(spacing: 136) {
                    Button(action: {exit(0)}) {
                        Image(systemName: "multiply")
                    }
                    Text("学生通行码")
                    Image(systemName: "ellipsis")
                }
                .padding(.top, 42.0)
                .foregroundColor(Color("QRCodeTextColor"))
            })
            Rectangle()
                .frame(height: 143.0)
                .foregroundColor(Color(red: 0.214, green: 0.437, blue: 0.917))
            Rectangle()
                .foregroundColor(Color(red: 0.973, green: 0.973, blue: 0.973))
            
        }
        .ignoresSafeArea()
        .overlay(content: {
            VStack(spacing: 10) {
                Spacer()
                    .frame(height: 40.0)
                QRCodePanel()
                    .frame(height: 460.0)
                QRCodeInfo()
                    .padding(.trailing, 176.0)
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    Button("通行记录", action: {})
                    Divider()
                        .fixedSize()
                    Button("普通码", action: {})
                }
            }
        })
        
    }
}

struct QRCodePanel: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var date = Date()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .shadow(radius: 10.0)
            .overlay(content: {
                VStack {
                    VStack {
                        Text({(_ now: Date) -> String in
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "MM月dd日"
                            return dateFormatter.string(from: Date())
                        }(date))
                            .fontWeight(.semibold)
                        Text({(_ now: Date) -> String in
                            let timeFormatter = DateFormatter()
                            timeFormatter.dateFormat = "HH:mm:ss"
                            return timeFormatter.string(from: Date())
                        }(date))
                            .fontWeight(.semibold)
                    }
                    .onReceive(timer) {time in
                        date = Date()
                    }
                    .frame(height: 69.0)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    
                    Divider()
                    
                    HStack() {
                        Text("材料工程与工程学院")
                        Text("2020316101023")
                    }
                    .foregroundColor(.black)
                    
                    Image("QRCode")
                        .frame(width: 283.0, height: 283.0)
                        .scaleEffect(0.777)
                        
                    
                    HStack {
                        Text("陈睿")
                            .foregroundColor(.black)
                        Button("刷新", action: {})
                            .foregroundColor(.blue)
                    }
                    
                }
            })
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
            
    }
}

struct QRCodeInfo: View {
    var body: some View {
        VStack(spacing: 10.0) {
            Text("2021-08-31 至 2022-01-15")
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("通行码类型：")
                        .foregroundColor(.gray)
                    Text("临时通行码")
                }
                HStack {
                    Text("剩余次数：")
                        .foregroundColor(.gray)
                    Text("10000")
                }
                Text("第一次刷卡时间：")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct QRCodeFake_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QRCodeFake()
            QRCodeFake()
                .preferredColorScheme(.dark)
            QRCodePanel()
            QRCodePanel()
                .preferredColorScheme(.dark)
            QRCodeInfo()
            QRCodeInfo()
                .preferredColorScheme(.dark)
        }
    }
}
