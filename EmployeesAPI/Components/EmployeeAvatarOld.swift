//
//  EmployeeAvatar.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

struct EmployeeAvatarOld: View {
    let avatarURL: URL?
    
    var body: some View {
        AsyncImage(url: avatarURL) { avatarImg in
            avatarImg
                .resizable()
                .scaledToFit()
                .frame(width: 75)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
        } placeholder: {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 75)
                .background(Color.gray.opacity(0.2))
                .background(in: Circle())
        }
    }
}

#Preview {
    EmployeeAvatarOld(avatarURL: Employee.test.avatarURL)
}
