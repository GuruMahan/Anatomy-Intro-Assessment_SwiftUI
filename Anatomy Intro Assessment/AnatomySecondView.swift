//
//  AnatomySecondView.swift
//  Anatomy Intro Assessment
//
//  Created by Guru Mahan on 28/12/22.
//

import SwiftUI

struct AnatomySecondView: View {
    let question1 : CreateQuestionModel?
    let optionList:CreateOptionModel?
    @State var question2 = ""
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    Text("passedValues")
                    Text(question1?.id ?? "")
                    Text(question1?.placeHolder ?? "")
                        .padding()
                    Text(optionList?.id ?? "")
                    Text(optionList?.placeHolder ?? "")
                    NavigationLink {
                        AnatomyThirdView()
                    } label: {
                        Text("Next")
                    }
                }
            }
        }
        .navigationTitle("secondView")
        .navigationBarBackButtonHidden(false)
    }
}

struct AnatomySecondView_Previews: PreviewProvider {
    static var previews: some View {
        AnatomySecondView(question1: CreateQuestionModel(), optionList: CreateOptionModel())
    }
}
