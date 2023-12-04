//
//  exportInfo.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

class ExportInfo {
    // Функция для разбиения текста на слова
    static func splitTextIntoWords(_ contents: String) -> [String] {
        return contents
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
    }

    // Функция для подсчета частоты слов
    static func calculateWordFrequency(_ words: [String]) -> [String: Int] {
        var frequency: [String: Int] = [:]
        words.forEach { frequency[$0, default: 0] += 1 }
        return frequency
    }

    // Функция для чтения файла и возврата списка слов
    static func readFileContents(at path: String) -> [String] {
        if let contents = try? String(contentsOfFile: path, encoding: .utf8) {
            return contents.components(separatedBy: "\n").filter { !$0.isEmpty }
        }
        return []
    }

    // Функция для фильтрации совпадающих и возможных тегов
    static func filterTags(frequency: [String: Int], tags: [String], notATags: [String]) -> (matched: [String], possible: [String]) {
        let matchedTags = frequency.keys.filter { tags.contains($0) }
        let possibleTags = frequency.keys.filter { word in
            !(tags.contains(word) || notATags.contains(word))
        }
        return (matchedTags, possibleTags)
    }

    // Функция для формирования различных секций отчета
    static func formatWordListSection(_ frequency: [String: Int]) -> String {
        let sortedWords = frequency.sorted { $0.value > $1.value }
        return sortedWords.map { "\($0.key) - \($0.value)" }.joined(separator: "\n")
    }

    static func formatMatchedTagsSection(_ tags: [String]) -> String {
        return tags.joined(separator: "\n")
    }

    static func formatPossibleTagsSection(_ tags: [String]) -> String {
        return tags.joined(separator: "\n")
    }

    static func formatVacanciesSection(for profession: Position, at level: Level, in companies: [Company]) -> String {
        var section = ""
        for company in companies {
            for vacancy in company.vacancies where vacancy.level == level && vacancy.profession == profession {
                section += "\(vacancy.profession) --- from \(vacancy.salaryRange.max)\n"
                section += "  \(company.name)\n"
                section += "  \(company.industry)\n"
                section += "---------------------------------------\n"
            }
        }
        return section
    }

    // Основная функция экспорта
    static func analyzeAndExportWordFrequency(from contents: String, level: Level, profession: Position, companies: [Company], matchingTagsPath tagsPath: String, notATagsPath: String, to filePath: String) {
        let words = splitTextIntoWords(contents)
        let frequency = calculateWordFrequency(words)
        let tags = readFileContents(at: tagsPath)
        let notATags = readFileContents(at: notATagsPath)

        let (matchedTags, possibleTags) = filterTags(frequency: frequency, tags: tags, notATags: notATags)

        var exportText = "# Words\n"
        exportText += formatWordListSection(frequency) + "\n\n"
        exportText += "# Matched tags\n" + formatMatchedTagsSection(matchedTags) + "\n\n"
        exportText += "# List of vacancies for \(profession) at \(level) level\n"
        exportText += formatVacanciesSection(for: profession, at: level, in: companies)
        exportText += "\n# Possible tags\n" + formatPossibleTagsSection(possibleTags) + "\n\n"

        // Запись в файл
        do {
            try exportText.write(toFile: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("Ошибка при записи файла анализа: \(error)")
        }
    }
}
