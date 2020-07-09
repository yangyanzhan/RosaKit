//
//  SoundRecognizerTests.swift
//  SoundRecognizerTests
//
//  Created by Hrebeniuk Dmytro on 30.06.2020.
//  Copyright © 2020 Hrebeniuk Dmytro. All rights reserved.
//

import XCTest
import RosaKit
import SoundRecognizer

class SoundRecognizerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecognizer() throws {
        let url = Bundle(for: Self.self).url(forResource: "1-137-A-32", withExtension: "wav")

        let soundFile = url.flatMap { try? WavFileManager().readWavFile(at: $0) }

        let int16Array = soundFile?.data.int16Array.map { Double($0)/32768.0 }
        
        let xshape = int16Array?.count ?? 0
        let size = 2048*30
        let offset = size/16
        let count = xshape/offset - 30/2
        
        let validCategory = 32
        
        let soundRecognizerEngine = SoundRecognizerEngine(sampleRate: 44100)
        
        var isCorrect = true
        
        for index in 0..<count {
            let samples = Array(int16Array?[offset*index..<offset*index + size] ?? [])
            let result = soundRecognizerEngine.predict(samples: samples)
            
            isCorrect = (result?.percentage ?? 0.0) > 0.95 && ((result?.category ?? -1) % 100) == validCategory
        }
        
        XCTAssertTrue(isCorrect)
    }

}
