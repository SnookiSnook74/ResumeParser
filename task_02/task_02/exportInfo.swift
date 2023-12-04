//
//  exportInfo.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

class ExportInfo {
    static func exportResume(parsedData: (candidateInfo: CandidateInfo?, educations: [Education], workExperiences: [WorkExperience], about: About?), to filePath: String) {
        guard let candidateInfo = parsedData.candidateInfo, let about = parsedData.about else {
            print("Необходимые данные отсутствуют.")
            return
        }

        var exportText = ""

        // Экспорт информации о кандидате
        exportText += "# Candidate info\n"
        exportText += "\(candidateInfo.fullName)\n"
        exportText += "\(candidateInfo.profession)\n"
        exportText += "\(candidateInfo.gender)\n"
        exportText += "\(candidateInfo.birthDate)\n"
        exportText += "\(candidateInfo.email)\n...\n\n"

        // Экспорт информации об образовании
        exportText += "# Education\n"
        for edu in parsedData.educations {
            exportText += "\(edu.type)\n"
            exportText += "\(edu.years)\n"
            exportText += "\(edu.description)\n"
        }
        exportText += "\n"

        // Экспорт опыта работы
        exportText += "# Job experience\n"
        for exp in parsedData.workExperiences {
            exportText += "##\n"
            exportText += "\(exp.period)\n"
            exportText += "\(exp.companyName)\n"
            exportText += "\(exp.description)\n"
        }
        exportText += "...\n\n"

        // Экспорт информации о себе
        exportText += "# Free block\n"
        exportText += "\(about.text)"

        // Запись в файл
        do {
            try exportText.write(toFile: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("Ошибка при записи файла: \(error)")
        }
    }

    static func analyzeAndExportWordFrequency(from contents: String, matchingTagsPath tagsPath: String, to filePath: String) {
        // Разбиваем текст на слова и фильтруем ненужные символы
        let words = contents
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }

        // Подсчет частоты каждого слова
        var frequency: [String: Int] = [:]
        words.forEach { frequency[$0, default: 0] += 1 }

        let tags = (try? String(contentsOfFile: tagsPath, encoding: .utf8))?
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }

        let matchedTags = frequency.keys.filter { tags?.contains($0) == true }

        // Сортировка слов по частоте в убывающем порядке
        let sortedWords = frequency.sorted { $0.value > $1.value }

        // Формирование текста для экспорта
        var exportText = "# Words\n"
        sortedWords.forEach { word, count in
            exportText += "\(word) - \(count)\n"
        }
        // Добавление совпадающих тегов
        if !matchedTags.isEmpty {
            exportText += "\n# Matched tags\n"
            matchedTags.forEach { exportText += "\($0)\n" }
        }

        // Запись в файл
        do {
            try exportText.write(toFile: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("Ошибка при записи файла анализа: \(error)")
        }
    }
}
