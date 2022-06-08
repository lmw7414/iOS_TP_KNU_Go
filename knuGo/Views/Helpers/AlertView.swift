//
//  AlertView.swift
//  knuGo
//
//  Created by lmw on 2022/06/08.
//

import SwiftUI

struct AlertView: View {
    @State private var showingAlert = false
    //@Binding var landmark : Landmark
    //@Binding var placeName : String
        var body: some View {
            VStack {
                Button("Show Alert") {
                    showingAlert = true
                }
            }
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Alert"),
                      message: Text("Alert Dialog"),
                      dismissButton: .default(Text("Close")))
            }
        }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
