//
//  AppleLoginView.swift
//  cloneTodoApp
//
//  Created by Daniel on 2024/03/09.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isLogined: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ListView(), isActive: $isLogined) {
                    EmptyView()
                }
                SignInWithAppleButton(
                    onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            print("Apple Login Successful")
                            switch authResults.credential{
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                   // 계정 정보 가져오기
                                    let UserIdentifier = appleIDCredential.user
                                    let fullName = appleIDCredential.fullName
                                    let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                                    let email = appleIDCredential.email
                                    let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                                    let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                                isLogined = true
                                break
                            default:
                                break
                            }
                            break
                        case .failure(let error):
                            print(error.localizedDescription)
                            print("error")
                            break
                        }
                    }
                )
                .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
                .cornerRadius(5)
            }
        }
        .environmentObject(listViewModel)
    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
