//
//  exportInfo.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

class ExportInfo {
    static func analyzeAndExportWordFrequency(from contents: String, level: Level, profession: Position, companies: [Company], matchingTagsPath tagsPath: String, to filePath: String) {
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

        // Добавление списка подходящих вакансий
        exportText += "\n# List of vacancies for \(profession) at \(level) level\n"
        for company in companies {
            for vacancy in company.vacancies where vacancy.level == level && vacancy.profession == profession {
                exportText += "\(vacancy.profession) --- from \(vacancy.salaryRange.max)\n"
                exportText += "  \(company.name)\n"
                exportText += "  \(company.industry)\n"
                exportText += "---------------------------------------\n"
            }
        }

        do {
            try exportText.write(toFile: filePath, atomically: true, encoding: .utf8)
        } catch {
            print("Ошибка при записи файла анализа: \(error)")
        }
    }
}
