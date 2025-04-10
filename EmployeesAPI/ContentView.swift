//
//  ContentView.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm = EmployeeVM()
    
    var body: some View {
        List(vm.employees) { employee in
            HStack {
                VStack(alignment: .leading){
                    Text("\(employee.lastName), \(employee.name)")
                        .font(.headline)
                    Text(employee.email)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                AsyncImage(url: employee.avatarURL) { avatarImg in
                    avatarImg
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 75)
                        .background(Color.gray.opacity(0.2))
                        .background(in: Circle())
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
        .alert("Employees data error", isPresented: $vm.showAlert) {
            
        } message: {
            Text(vm.errorMsg)
        }

    }
}

#Preview {
    ContentView(vm: EmployeeVM(repository: NetworkTest()))
}
