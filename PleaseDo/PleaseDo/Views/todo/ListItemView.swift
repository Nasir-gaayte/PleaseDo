import SwiftUI

struct ListItemView: View {
    
    let item: Item
    let height: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(item.description)
                    .font(.caption)
            }
            Spacer()
            Image(systemName: iconName(for: item.priority))
                .font(.system(size: 30))
                .foregroundColor(color(for: item.priority))
        }
        .padding()
        .frame(height: height)
    }
        
    
    func iconName(for priority: Priority) -> String {
        switch priority {
        case .high:
            return "exclamationmark.circle"
        case .medium:
            return "square"
        case .low:
            return "rectangle"
        case .unowned:
            return "xmark.circle"
        }
    }
    
    func color(for priority: Priority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .yellow
        case .low:
            return .blue
        case .unowned:
            return .orange
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(
        item: Item(
            id: "1",
            authorId: "nasir",
            title: "Test To Do",
            description: "This is a test todo description", startDate: .now,
            status: .done,
            priority: .low
        ),
        height: 100
    )
}
