//
//  EmployeeCell.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

struct EmployeeCell: View {
    let employee: Employee
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading){
                Text("\(employee.lastName), \(employee.name)")
                    .font(.headline)
                Text(employee.email)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom)
                Text(employee.username)
                    .font(.caption)
                    .italic()
            }
            Spacer()
            EmployeeAvatar(avatarURL: employee.avatarURL)
        }
    }
}

#Preview {
    EmployeeCell(employee: Employee.test)
}
