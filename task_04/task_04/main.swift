//
//  main.swift
//  task_04
//
//  Created by DonHalab on 29.11.2023.
//

import Foundation

let companyGroup: [Company] = [companyOne, companyTwo, companyThree, companyFour, companyFive]

// Укажите путь к файлу резюме
let resumeParser = ResumeParser(filePath: "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/resume.txt")

do {
    if let (candidateInfo, _, workExp, aboutPerson) = try resumeParser.fullParseInfo() {
        // Куда будем записывать
        let exportFilePathWords = "/Users/donhalab/Desktop/analysis.txt"
        // От куда будем брать тэги
        let tags = "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/tags.txt"
        let notATags = "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/NotATag.txt"
        let (carierYear, profession) = CareerCalculator.calculateTotalExperience(in: workExp, info: candidateInfo!)
        let careerLevel = CareerCalculator.calculateLevel(from: carierYear)
        let careerProfession = CareerCalculator.calculateProffesion(from: profession)
        ExportInfo.analyzeAndExportWordFrequency(from: aboutPerson?.text ?? "", level: careerLevel, profession: careerProfession, companies: companyGroup, matchingTagsPath: tags, notATagsPath: notATags, to: exportFilePathWords)
    } else {
        print("Ошибка при парсинге файла.")
    }
} catch {
    print("Ошибка при парсинге резюме: \(error)")
}
