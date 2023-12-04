//
//  candidate.swift
//  task_01
//
//  Created by DonHalab on 24.11.2023.
//

import Foundation

/* Имя
 Профессия (Developer, QA, Project Manager, Analyst, Designer)
 Уровень (junior, middle, senior)
 Предполагаемый уровень зарплаты
 Навыки */

class Candidate {
    let name: String
    let profession: Position
    let level: Level
    let expectedSalary: Double
    let skills: [String]

    init(name: String, profession: Position, level: Level, expectedSalary: Double, skills: [String]) {
        self.name = name
        self.profession = profession
        self.level = level
        self.expectedSalary = expectedSalary
        self.skills = skills
    }
}
