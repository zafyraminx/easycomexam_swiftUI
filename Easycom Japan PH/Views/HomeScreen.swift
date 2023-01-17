//
//  HomeScreen.swift
//  Easycom Japan PH
//
//  Created by Michael Angelo Zafra on 1/16/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel:HomeViewModel
    @State var linkIsActive: Bool = false
    
    var body: some View {
        NavigationStack{
            List(viewModel.entries) { entry in
                NavigationLink(destination: DetailsScreen(detail: entry)) {
                    VStack{
                        HStack(alignment: .top) {
                            ZStack {
                                Button(action: {
                                    print("tap")
                                    viewModel.actionSheet(url: entry.thumbnailUrl ?? "")
                                }, label: {
                                    AsyncImage(url: URL(string: entry.thumbnailUrl ?? "")) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        //put your placeholder here
                                    }
                                })
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 150.0)
                                
                                Text(" ID: \(entry.id ?? 0) ")
                                    .font(.system(size: 12, weight: .bold))
                                    .padding(.vertical, 2.0)
                                    .padding(.horizontal, 5.0)
                                    .foregroundColor(Color.white)
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                    .padding(10.0)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            
                            ZStack() {
                                Text(entry.title ?? "")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding()
                                    .foregroundColor(Color.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.vertical)
                        
                        Line()
                          .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                          .frame(height: 1)
                    }
                    .listRowSeparator(.hidden)
                    .navigationTitle("Exam")
                }
            }
            .navigationBarHidden(true)
//            .navigationBarTitle("", displayMode: .inline)
        }
        .listStyle(GroupedListStyle())
        .onAppear() {
            viewModel.getEntries(completion: {
                data in
                print("we have new data! \(data)")
                viewModel.entries = data
            })
        }
    }
    
    struct Line: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            return path
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
