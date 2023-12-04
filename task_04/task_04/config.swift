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

enum Industry {
    case IT, Banking, PublicServices
}

struct Vacancy {
    let profession: Position
    let level: Level
    let salaryRange: SalaryRange
}

enum Position {
    case Developer, QA, ProjectManager, Analyst, Designer, Empty
}

enum Level {
    case Junior, Middle, Senior
}

struct SalaryRange {
    let min: Double
    let max: Double
}

struct Contacts {
    let email: String
    let phone: String
    let address: String?
}

enum ResumeParserError: Error {
    case missingCandidateInfo
    case missingEducation
    case missingWorkExperience
    case missingAboutSection
}
