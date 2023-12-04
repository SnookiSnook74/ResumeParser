//
//  config.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

struct CandidateInfo {
    let fullName: String
    let profession: String
    let gender: String
    let birthDate: String
    let email: String
}

struct Education {
    let type: String
    let years: String
    let description: String
}

struct WorkExperience {
    let period: String
    let companyName: String
    let description: String
}

struct About {
    let text: String
}
