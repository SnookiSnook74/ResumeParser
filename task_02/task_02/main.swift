//
//  main.swift
//  task_02
//
//  Created by DonHalab on 28.11.2023.
//

import Foundation

// Создание экземпляра ResumeParser с указанием пути к файлу резюме
let resumeParser = ResumeParser(filePath: "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/resume.txt")

if let parsedData = resumeParser.fullParseInfo() {
    // Путь к файлу для экспорта
    let exportFilePath = "/Users/donhalab/Desktop/export.txt"
    let exportFilePathWords = "/Users/donhalab/Desktop/analysis.txt"
    let tags = "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/tags.txt"
    ExportInfo.exportResume(parsedData: parsedData, to: exportFilePath)
    ExportInfo.analyzeAndExportWordFrequency(from: parsedData.3?.text ?? "", matchingTagsPath: tags, to: exportFilePathWords)
    // ExportInfo.analyzeAndExportWordFrequency(from: parsedData.3?.text ?? "" , to: exportFilePathWords)
} else {
    print("Ошибка при парсинге файла.")
}
