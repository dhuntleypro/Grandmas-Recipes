//
//  HalfModalView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//


import SwiftUI

// modal sometime refured to as modal
struct HalfModalView<Content:View>: View {
    
    @GestureState private var dragState = DragState.inactive
    @Binding var isShown: Bool
    
    // account for tabview spacing
    var isNear_tabView = false
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2/3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
            isShown = false
        }
    }
    
    
    // defualt height value
    var modalHeight:CGFloat = 400
    
    var content: () -> Content
    var body: some View {
        
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
        }
        .onEnded(onDragEnded)
        
        return Group {
            
            // Background (Dismissable)
            ZStack{
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                UIApplication.shared.endEditing()
                                self.isShown = false
                        }
                )
            }
            
            //Foreground
            VStack{
                Spacer()
                ZStack{
                    Color.white.opacity(1.0)
                        .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    VStack{
                        self.content()
                        .padding()
                        .padding(.bottom, 65)
                        .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                        .clipped()
                        if isNear_tabView {
                            Spacer().frame(height:65) //(fix) -- hard coded need to fit all apps
                        }
                    }
                }
                .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                .gesture(drag)
                
                
            }.KeyboardAwarePadding()
        }.edgesIgnoringSafeArea(.all)
        
    }
}
