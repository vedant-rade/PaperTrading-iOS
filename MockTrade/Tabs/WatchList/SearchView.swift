//
//  SearchView.swift
//  MockTrade
//
//  Created by Vedant on 28/12/25.
//

import SwiftUI

struct SearchView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Custom Navigation Bar
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.primary)
                }

                HStack {
                    TextField("Search stock", text: $searchText)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .focused($isTextFieldFocused)

                    if !searchText.isEmpty {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.secondarySystemBackground))
                )

                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isTextFieldFocused = true
            }
        }
    }
}


#Preview {
    SearchView()
}
