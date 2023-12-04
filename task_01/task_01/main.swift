//
//  main.swift
//  task_01
//
//  Created by DonHalab on 24.11.2023.
//

import Foundation

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
        .init(profession: .Developer, level: .Senior, salaryRange: .init(min: 50000, max: 250_000)),
    ],
    requiredSkills: ["Swift", "Firebase", "MVVM", "Python"],
    contacts: .init(email: "hr@codemasters.dev", phone: "89007654321", address: "Tech Park, 22")
)

let companyFive = Company(
    name: "CityServices",
    industry: .PublicServices,
    description: "Municipal services and management",
    vacancies: [
        .init(profession: .ProjectManager, level: .Middle, salaryRange: .init(min: 70000, max: 80000)),
    ],
    requiredSkills: ["Project Management", "Communication", "Leadership"],
    contacts: .init(email: "office@cityservices.org", phone: "84951234567", address: "Public Sector Lane, 8")
)

let companyGroup: [Company] = [companyOne, companyTwo, companyThree, companyFour, companyFive]

let candidate = Candidate(name: "Anatoly", profession: .Developer, level: .Junior, expectedSalary: 100_000, skills: ["Swift", "MVVM"])

func menu() {
    var vacanciesList: [(companyIndex: Int, vacancyIndex: Int)] = []
    var professionSet: Set<Industry> = []

    // Сбор информации о подходящих вакансиях и индустриях
    for (companyIndex, company) in companyGroup.enumerated() {
        for (vacancyIndex, vacancy) in company.vacancies.enumerated() {
            if candidate.expectedSalary <= vacancy.salaryRange.max, candidate.profession == vacancy.profession {
                vacanciesList.append((companyIndex, vacancyIndex))
                professionSet.insert(company.industry)
            }
        }
    }

    // Вывод списка индустрий
    let industries = professionSet.map { "\($0)" }.joined(separator: ". ")
    print("\(industries). \(candidate.level). >= \(Int(candidate.expectedSalary))")

    // Вывод списка подходящих вакансий
    print("The list of suitable vacancies:")
    for (index, (companyIndex, _)) in vacanciesList.enumerated() {
        let company = companyGroup[companyIndex]
        print("\(index + 1).")
        company.companyInfo(candidatSalary: candidate.expectedSalary)
    }

    // Обработка выбора пользователя
    if let selectionString = readLine(), let selection = Int(selectionString), selection > 0, selection <= vacanciesList.count {
        let selectedVacancy = vacanciesList[selection - 1]
        let interview = companyGroup[selectedVacancy.companyIndex].interview(vacancyIndex: selectedVacancy.vacancyIndex, candidate: candidate)
        print("Processing Interview...")
        print(interview ? "Success, candidate was applied." : "Fail, candidate was rejected.")
    } else {
        print("Incorrect input")
    }
}

menu()
