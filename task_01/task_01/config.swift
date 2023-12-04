//
//  config.swift
//  task_01
//
//  Created by DonHalab on 24.11.2023.
//

import Foundation

enum Industry {
    case IT, Banking, PublicServices
}

struct Vacancy {
    let profession: Position
    let level: Level
    let salaryRange: SalaryRange
}

enum Position {
    case Developer, QA, ProjectManager, Analyst, Designer
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
