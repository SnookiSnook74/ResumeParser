//
//  carierCalculator.swift
//  task_03
//
//  Created by DonHalab on 29.11.2023.
//

import Foundation

class CareerCalculator {
    static func calculateTotalExperience(in workExperiences: [WorkExperience], info: CandidateInfo) -> (Int, String) {
        let totalYears = workExperiences.reduce(0) { total, experience in
            let yearsRange = experience.period.split(separator: "-").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
            if yearsRange.count == 2 {
                let years = yearsRange[1] - yearsRange[0]
                return total + years
            }
            return total
        }
        return (totalYears, info.profession)
    }

    static func calculateLevel(from totalYears: Int) -> Level {
        switch totalYears {
        case 0 ..< 1:
            return .Junior
        case 1 ..< 3:
            return .Middle
        default:
            return .Senior
        }
    }

    static func calculateProffesion(from proffesion: String) -> Position {
        switch proffesion {
        case "QA":
            return .QA
        case "Developer":
            return .Developer
        case "Analyst":
            return .Analyst
        case "Designer":
            return .Designer
        case "ProjectManager":
            return .ProjectManager
        default:
            return .Empty
        }
    }
}
