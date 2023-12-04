//
//  resumeParser.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

class ResumeParser {
    let filePath: String

    init(filePath: String) {
        self.filePath = filePath
    }

    func fullParseInfo() -> (CandidateInfo?, [Education], [WorkExperience], About?)? {
        guard let contents = readFile() else {
            print("Не удалось прочитать файл.")
            return nil
        }

        let candidateInfo = parseCandidateInfo(from: contents)
        let educations = parseEducation(from: contents)
        let workExp = parseJobExperience(from: contents)
        let aboutPerson = parseAboutPerson(from: contents)

        return (candidateInfo, educations, workExp, aboutPerson)
    }

    func readFile() -> String? {
        let fileManager = FileManager.default

        guard fileManager.fileExists(atPath: filePath) else {
            print("Файл не найден! \(filePath)")
            return nil
        }
        do {
            let read = try String(contentsOfFile: filePath, encoding: .utf8)
            return read
        } catch {
            print("Ошибка чтения файла \(error)")
            return nil
        }
    }

    private func parseCandidateInfo(from contents: String) -> CandidateInfo? {
        // Ищем блок информации о кандидате
        let candidateInfoComponents = contents.components(separatedBy: "# Candidate info\n").last?
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty && $0 != "..." }

        // Проверяем, что у нас достаточно строк для создания структуры
        guard let infoComponents = candidateInfoComponents, infoComponents.count >= 5 else {
            print("Недостаточно информации о кандидате.")
            return nil
        }
        // Создаем и возвращаем структуру CandidateInfo
        let candidateInfo = CandidateInfo(
            fullName: infoComponents[0],
            profession: infoComponents[1],
            gender: infoComponents[2],
            birthDate: infoComponents[3],
            email: infoComponents[4]
        )

        return candidateInfo
    }

    private func parseEducation(from contents: String) -> [Education] {
        let educationComponents = contents.components(separatedBy: "# Education").last?.components(separatedBy: "\n\n").first?.components(separatedBy: "\n").filter { !$0.isEmpty && $0 != "..." }

        // Проверяем, что информация о каждом учебном заведении состоит из трех частей
        guard let educationLines = educationComponents, educationLines.count % 3 == 0 else {
            print("Недостаточно информации об образовании или неверный формат.")
            return []
        }

        // Создаем массив структур Education
        var educations: [Education] = []
        for i in stride(from: 0, to: educationLines.count, by: 3) {
            let education = Education(
                type: educationLines[i],
                years: educationLines[i + 1],
                description: educationLines[i + 2]
            )
            educations.append(education)
        }
        return educations
    }

    private func parseJobExperience(from contents: String) -> [WorkExperience] {
        let jobExperience = contents.components(separatedBy: "# Job experience").last?.components(separatedBy: "\n\n").first?.components(separatedBy: "\n").filter { !$0.isEmpty && $0 != "..." && $0 != "##" }

        guard let experienceLines = jobExperience, experienceLines.count % 3 == 0 else {
            print("Недостаточно информации о работе")
            return []
        }

        var workExp: [WorkExperience] = []

        for i in stride(from: 0, to: experienceLines.count, by: 3) {
            let exp = WorkExperience(
                period: experienceLines[i],
                companyName: experienceLines[i + 1],
                description: experienceLines[i + 2]
            )
            workExp.append(exp)
        }
        return workExp
    }

    private func parseAboutPerson(from contents: String) -> About? {
        guard let aboutPerson = contents.components(separatedBy: "# Free block\n").last,
              !aboutPerson.isEmpty
        else {
            print("Секция 'О себе' не найдена или пуста.")
            return nil
        }
        let aboutInfo = About(text: aboutPerson)
        return aboutInfo
    }
}
