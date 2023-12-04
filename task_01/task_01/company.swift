//
//  company.swift
//  task_01
//
//  Created by DonHalab on 24.11.2023.
//

import Foundation

/* Создайте коллекцию компаний, каждая из которых описана следующим образом:

 Имя
 Деятельность (IT, Banking, Public services)
 Описание
 Список вакансий, каждая из которых содержит информацию о профессии (Developer, QA, Project Manager, Analyst, Designer), level (junior, middle, senior) и предполагаемый уровень зарплаты
 Список необходимых навыков (например ["swift", "CoreData", "Realm"])
 Контакты */

class Company {
    let name: String
    let industry: Industry
    let description: String
    var vacancies: [Vacancy]
    let requiredSkills: [String]
    let contacts: Contacts

    init(name: String, industry: Industry, description: String, vacancies: [Vacancy], requiredSkills: [String], contacts: Contacts) {
        self.name = name
        self.industry = industry
        self.description = description
        self.vacancies = vacancies
        self.requiredSkills = requiredSkills
        self.contacts = contacts
    }

    func interview(vacancyIndex _: Int, candidate _: Candidate) -> Bool {
        let skill = requiredSkills.filter { candidate.skills.contains($0) }
        if skill.count >= requiredSkills.count / 2 {
            return Bool.random()
        } else {
            return false
        }
    }

    func companyInfo(candidatSalary: Double) {
        print("""
        \(vacancies[0].level) \(vacancies[0].profession)    ---    >= \(candidatSalary)
        \(name)
        \(industry)
        \(requiredSkills)
        ---------------------------------------
        """)
    }
}
