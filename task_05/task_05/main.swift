//
//  main.swift
//  task_05
//
//  Created by DonHalab on 29.11.2023.
//

import Foundation

func compareTextFiles(file1Path: String, file2Path: String) {
    do {
        // Чтение содержимого первого файла
        let content1 = try String(contentsOfFile: file1Path, encoding: .utf8)

        // Чтение содержимого второго файла
        let content2 = try String(contentsOfFile: file2Path, encoding: .utf8)

        // Сравнение содержимого файлов
        if content1 == content2 {
            print("Text comparator: resumes are identical")
        } else {
            print("Text comparator: resumes are different")
        }
    } catch {
        print("Error: \(error)")
    }
}

// Сравнение с документом из task_02
let file1Path = "/Users/donhalab/Desktop/export.txt"
let file2Path = "/Users/donhalab/Desktop/Swift_Bootcamp.Day02-1/data-samples/resume.txt"

compareTextFiles(file1Path: file1Path, file2Path: file2Path)
