import SwiftUI

struct SelectRow: View {
    let text: String
    @Binding var isSelected: Bool

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                Text(text)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                } else {
                    EmptyView()
                }
            }
            .foregroundColor(isSelected == true ? Color.ondosee(.system(.primary)) :
                                Color.ondosee(.system(.background))
            )
        }
    }
}
