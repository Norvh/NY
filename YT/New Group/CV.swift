// Created by Florian Schweizer on 21.05.22

import SwiftUI







    
struct CV: View {
    @State private var showSecondView = false
    var message = "Hello from ContentView"
    
 
 

    @State private var colors: [Color] = [
       
        .blue
        
    ]
    
   
    var body: some View {
        NavigationView {
   
            CustomARViewRepresentable()
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {
                    ScrollView(.horizontal) {
                        HStack {
                            
                            
                            Button {
                                ARManager.shared.actionStream.send(.removeAllAnchors)
                            } label: {
                                Image(systemName: "trash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(16)
                            }
                            
                            ForEach(colors, id: \.self) { color in
                                Button {
                                    ARManager.shared.actionStream.send(.placeBlock(color: color))
                                } label: {
                                    color
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(.regularMaterial)
                                        .cornerRadius(16)
                                }
                            }
                            
                            Button(action: {
                                print("DEBUG: Countinue to code game.")
                                // self.modelConfirmedForPlacement = self.selectedModel
                                //self.resetPlacementParameters()
                            }) {
                                
                                NavigationLink(destination: CV2(message: "")
                                    .navigationBarBackButtonHidden(true)) {
                                        HStack{
                                            Text("خلاص")
                                            //Image(systemName:"xmark")
                                            // Text("٢ لاعبين")
                                            // Image(systemName: "person.2")
                                        }
                                        // .imageScale(.large)
                                        // image(Systemname:"Xmark")
                                        .frame(width: 140, height: 40)
                                        .font(.title3)
                                        .background(Color.white.opacity(0.75))
                                        .foregroundColor(.blue)
                                        .cornerRadius(30)
                                        .padding(20)
                                    }
                            }
                        }
                        .padding()
                        
                    }
                    Button(action: {
                        self.showSecondView.toggle()
                    }){
                       Text("")
                    }.sheet(isPresented: $showSecondView){
                        CV(message: self.message)
                    }
                }
            }
                }
        }

struct CV_Previews: PreviewProvider {
    static var previews: some View {
        CV()
    }
}


