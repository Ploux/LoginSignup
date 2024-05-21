//
//  LoginView.swift
//  LoginSignup
//
//  Created by Peter Loux on 5/21/24.
//

import SwiftUI

enum FocusedField {
    case email
    case password
}

struct LoginView: View {
    @State private var emailText = ""
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login here")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color("primaryBlue"))
                    .padding(.bottom)
                Text("Welcome back. You've\nbeen missed!")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                TextField("Email", text: $emailText)
                    .focused($focusedField, equals: .email)
                    .padding()
                    .background(Color("secondaryBlue"))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("primaryBlue"), lineWidth: 3)
                )
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
