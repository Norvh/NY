// Created by Florian Schweizer on 21.05.22

import SwiftUI






struct CV2: View {
    // SECOND VIEW
  

   
        var message: String
        
     
   

    @State private var selectedPage: CV = CV()
    @State private var colors: [Color] = [
        .green,
        .red,
        .blue
        
    ]
   
    
    var body: some View {
        
        CustomARViewRepresentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                ScrollView(.horizontal) {
                    HStack {
                        
                        
                        Button {
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                        } label: {
                            Image(systemName: "hand.tap")
                                .resizable()
                                .scaledToFit()
                            
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        
                        
                    }
                }
                .padding()
                
            }
        Text("\(message)")
        }
    }
    
struct CV2_Previews: PreviewProvider {
    static var previews: some View {
        CV2(message: "v")
    }
}
