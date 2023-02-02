//
//  AnatomyModel.swift
//  Anatomy Intro Assessment
//
//  Created by Guru Mahan on 27/12/22.
//

import Foundation


  struct CreateQuestionModel{
    var id: String = ""
    var name: String = ""
    var placeHolder = ""
    var text: String = ""
    var attachments: [String] = []
    var options: [CreateOptionModel] = []
   
  }
  struct CreateOptionModel{
      var id: String = ""
    var name: String = ""
    var placeHolder = ""
    var attachments: [String] = []
    var isAnswer: Bool = false
    var isSelected = false
  }










