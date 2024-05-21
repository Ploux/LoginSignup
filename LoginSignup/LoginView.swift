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
    @State private var passwordText = ""
    @State private var isValidEmail = true
    @State private var isValidPassword = true

    var canProceed: Bool {
        Validator.validateEmail(emailText) && Validator.validatePassword(passwordText)
    }
    
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
                            .stroke(!isValidEmail ? .red : focusedField == .email ? Color("primaryBlue"): .white, lineWidth: 3)
                    )
                    .padding(.horizontal)
                    .onChange(of: emailText) {
                        isValidEmail = Validator.validateEmail(emailText)
                    }
                if !isValidEmail && focusedField != .email {
                    HStack {
                     Text("Your email is not valid")
                        .foregroundColor(.red)
                        .padding(.leading)
                    }
                }
                
                SecureField("Password", text: $passwordText)
                    .focused($focusedField, equals: .password)
                    .padding()
                    .background(Color("secondaryBlue"))
                    .cornerRadius(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(!isValidPassword ? .red : focusedField == .password ? Color("primaryBlue"): .white, lineWidth: 3)
                    )
                    .padding(.horizontal)
                    .onChange(of: passwordText) {
                        isValidPassword = Validator.validatePassword(passwordText)
                    }
                if !isValidPassword && focusedField != .password {
                    HStack {
                        Text("Your password is not valid")
                            .foregroundColor(.red)
                            .padding(.leading)
                    }
                }
                
                HStack {
                 Spacer()
                    Button {
                        // action
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color("primaryBlue"))
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding(.trailing)
                    
                }
                
                Button {
                    // action
                } label: {
                    Text("Sign in")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("primaryBlue"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .opacity(canProceed ? 1.0 : 0.5)
                    .disabled(!canProceed)
                            
            
            Button {
                    // action
                } label: {
                    Text("Create new account")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("textGray"))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}
