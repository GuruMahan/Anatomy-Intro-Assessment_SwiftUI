//
//  AnatomyViewModel.swift
//  Anatomy Intro Assessment
//
//  Created by Guru Mahan on 27/12/22.
//

import Foundation

class AnatomyViewModel: ObservableObject {
    @Published var questionsList: [CreateQuestionModel] = []
    @Published var questionSelected:CreateQuestionModel?
    @Published var optionSelected:CreateOptionModel?
    init() {
        questionsList.append(createNewQuestion(index: questionCount))
        questionsList.append(createNewQuestion(index: questionCount))
        questionsList.append(createNewQuestion(index: questionCount))
    }
    
    var questionCount: Int {
        questionsList.count
    }
    
    func createNewQuestion(index: Int) ->CreateQuestionModel {
        
        var question =  createQuestion(text: "Question", placeHolder: "Question", id: "\(questionsList.count)", option: CreateOptionModel(), optionPlaceHolder: "option-1", optionId: "0")
        for index in 1..<3{
            question.options.append(CreateOptionModel(id: "\(index)", placeHolder: "Option \(index+1)"))
        }
        return question
    }
    
    func createQuestion(text:String,placeHolder:String,id:String,option:CreateOptionModel,optionPlaceHolder:String,optionId:String) -> CreateQuestionModel{
        var question = CreateQuestionModel()
        question.text = text
        question.placeHolder = placeHolder
        question.id = id
        var option1 = option
        option1.placeHolder = optionPlaceHolder
        option1.id = optionId
        question.options.append(option1)
        return question
    }
    
    func indexOf(question: CreateQuestionModel) -> Int? {
        questionsList.lastIndex(where: { $0.id == question.id })
    }
    
    func addNewQuestion() {
        questionsList.append(createNewQuestion(index: questionCount))
    }
    
    func insertNewQuestion(question: CreateQuestionModel) {
        if let index = questionsList.lastIndex(where: { $0.id == question.id }) {
            questionsList.insert(createNewQuestion(index: index+1), at: index+1)
        }
    }
    
    func removeQuestion(question: CreateQuestionModel) {
        if let index = questionsList.lastIndex(where: { $0.id == question.id }) {
            questionsList.remove(at: index)
        }
    }
    
    func addNewOption(question: CreateQuestionModel) {
        if let index = questionsList.lastIndex(where: { $0.id == question.id }) {
            questionsList[index].options.append(CreateOptionModel())
        }
    }
    func changeOption(question: CreateQuestionModel, option: CreateOptionModel) {
        if let indexO = questionsList.lastIndex(where: { $0.id ==  question.id }) {
            for (indexI,model) in questionsList[indexO].options.enumerated() {
                if model.id == option.id {
                    questionsList[indexO].options[indexI].isSelected = true
                } else {
                    questionsList[indexO].options[indexI].isSelected = false
                }
            }
        }
    }
}
