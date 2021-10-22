//
//  ContentView.swift
//  Shared
//
//  Created by 陈驰坤 on 2021/6/28.
//

import SwiftUI
import WebKit

struct ContentView: View {
    let EZheLi_URL = URL(string: "http://stu.zstu.edu.cn")
    var body: some View {
        QRCodeFake()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
