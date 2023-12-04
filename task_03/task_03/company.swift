//
//  company.swift
//  task_03
//
//  Created by DonHalab on 29.11.2023.
//

import Foundation

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

let companyOne = Company(
    name: "OOO \"SuperPay\"",
    industry: .Banking,
    description: "Innovative banking technologies",
    vacancies: [
        .init(profession: .Developer, level: .Junior, salaryRange: .init(min: 100_000, max: 150_000)),
    ],
    requiredSkills: ["Python", "Matlab", "TensorFlow", "Excel"],
    contacts: .init(email: "contact@superpay.com", phone: "88005553535", address: "Finance Street, 1")
)

let companyTwo = Company(
    name: "MMM",
    industry: .PublicServices,
    description: "Public services and administration",
    vacancies: [
        .init(profession: .Developer, level: .Junior, salaryRange: .init(min: 100_000, max: 130_000)),
    ],
    requiredSkills: ["Excel", "Access"],
    contacts: .init(email: "info@mmm.org", phone: "84951231212", address: "Government Ave, 20")
)

let companyThree = Company(
    name: "CryptoSuperGo",
    industry: .Banking,
    description: "Leading in cryptocurrency solutions",
    vacancies: [
        .init(profession: .Analyst, level: .Junior, salaryRange: .init(min: 100_000, max: 160_000)),
        .init(profession: .Developer, level: .Junior, salaryRange: .init(min: 100_000, max: 250_000)),
    ],
    requiredSkills: ["Python", "SQL", "Matlab", "Pandas"],
    contacts: .init(email: "hr@cryptosupergo.com", phone: "89001234567", address: "Blockchain Blvd, 7")
)

let companyFour = Company(
    name: "CodeMasters",
    industry: .IT,
    description: "Cutting-edge software development",
    vacancies: [
        .init(profession: .QA, level: .Senior, salaryRange: .init(min: 50000, max: 250_000)),
    ],
    requiredSkills: ["Swift", "Firebase", "MVVM", "Python"],
    contacts: .init(email: "hr@codemasters.dev", phone: "89007654321", address: "Tech Park, 22")
)

let companyFive = Company(
    name: "CityServices",
    industry: .PublicServices,
    description: "Municipal services and management",
    vacancies: [
        .init(profession: .QA, level: .Senior, salaryRange: .init(min: 70000, max: 80000)),
    ],
    requiredSkills: ["Project Management", "Communication", "Leadership"],
    contacts: .init(email: "office@cityservices.org", phone: "84951234567", address: "Public Sector Lane, 8")
)
