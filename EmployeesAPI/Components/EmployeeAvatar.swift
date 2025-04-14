//
//  EmployeeAvatar.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

struct EmployeeAvatar: View {
     let avatarURL: URL?
     @State private var imageVM = AsyncImageVM()
     
     var body: some View {
         if let image = imageVM.image {
             Image(uiImage: image)
                 .resizable()
                 .scaledToFit()
                 .frame(width: 75)
                 .background(Color.gray.opacity(0.2))
                 .clipShape(Circle())
         } else {
             Image(systemName: "person")
                 .resizable()
                 .scaledToFit()
                 .padding()
                 .frame(width: 75)
                 .background(Color.gray.opacity(0.2))
                 .background(in: Circle())
                 .onAppear {
                     imageVM.getImage(url: avatarURL)
                 }
         }
     }
 }
 
 #Preview {
     EmployeeAvatar(avatarURL: Employee.test.avatarURL)
 }
