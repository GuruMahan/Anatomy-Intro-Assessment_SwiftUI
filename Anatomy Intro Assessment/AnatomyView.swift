//
//  ContentView.swift
//  Anatomy Intro Assessment
//
//  Created by Guru Mahan on 27/12/22.
//

import SwiftUI

struct AnatomyView: View {
    
    @ObservedObject var viewModel = AnatomyViewModel()
    
    @State var readyToNavigate: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
            ZStack{
                LinearGradient(colors: [Color(hex:  "#FFDCDCDC").opacity(0.5)], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                VStack {
                    VStack{
                        headerView
                            .frame(height: 100)
                    }
                    
                    VStack{
                        ScrollView {
                            VStack{
                                
                                //  Text(secondView.question1)
                                ForEach(viewModel.questionsList, id: \.id) { question in
                                    NavigationLink {
                                        AnatomySecondView(question1: question, optionList: viewModel.optionSelected)
                                    } label: {
                                        questionsView(question:question )
                                            .foregroundColor(Color.black)
                                        //viewModel.questionSelected = question
                                        
                                        //
                                    }
                                    
                                    .background(Color.white)
                                    .padding(5)
                                    
                                    //                                            .onTapGesture {
                                    //                                                viewModel.questionSelected = question
                                    //                                            readyToNavigate = true
                                    //
                                    //                                            }
                                }
                                .cornerRadius(30)
                                
                            }
                            
                        }
                        .padding()
                        bottomView
                        
                    }
                }
            }
            
            .navigationBarTitleDisplayMode(.automatic)
        }
        }
        
        
    }
    
    @ViewBuilder var headerView:some View{
        
        ZStack {
            
            LinearGradient(colors:[Color(hex: "1A7BDC"),Color(hex: "56B8FF")], startPoint: .leading, endPoint:.trailing).ignoresSafeArea()
            HStack{
                Button {
                    
                } label: {
                    Image(systemName:"arrow.backward")
                        .foregroundColor(.white)
                }
                .padding(.top,-20)
                
                
                VStack {
                    Text("Anatomy Intro Assessment")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(Font.system(size: 18))
                    Text("3 Questions • Quiz Timer 04:00 ")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                    
                        .padding(.top,1)
                        .padding(.leading,-30)
                }
                .padding()
            }
            .padding(.leading,-50)
            
        }
    }
    
    @ViewBuilder func questionsView(question: CreateQuestionModel) -> some View{
        VStack {
            VStack{
                
                Text(question.text)
            }
            Divider()
            HStack {
                VStack{
                    ForEach(0..<question.options.count, id: \.self) { index in
                        let option = question.options[index]
                        HStack {
                            Button {
                                viewModel.changeOption(question: question, option: option)
                                viewModel.optionSelected = option
                            } label: {
                                Image(systemName: option.isSelected  ?   "largecircle.fill.circle" : "circle")
                                    .foregroundColor(option.isSelected ? .green : .black)
                            }
                            Text("\(option.placeHolder)")
                           
                            Spacer()
                        }
                        .padding()
                       
                        .onTapGesture {
                           
                           // readyToNavigate = true
                            
                        }
                    }
                    
                }
            }
            Spacer()
        }
        .navigationDestination(isPresented: $readyToNavigate) {
            AnatomySecondView(question1: viewModel.questionSelected, optionList: viewModel.optionSelected)
        }
        .navigationTitle("ThirdView")
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.automatic)
        
    }
    
    
    @ViewBuilder var bottomView: some View{
        
        ZStack{
            
            /*
             // NavigationLink("Submit", destination: secondView)
             NavigationLink {
             secondView
             } label: {
             Text("Submit")
             .font(Font.system(size: 18))
             .fontWeight(.bold)
             .frame(width:300,height: 40)
             .foregroundColor(Color.white)
             .background(Color.blue)
             .cornerRadius(20)
             .padding()
             
             }
             */
            Button {
                readyToNavigate = true
            } label: {
                Text("Submit")
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                    .frame(width:300,height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding()
            }
            
        }
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnatomyView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
