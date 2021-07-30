//
//  MediumRateWidget.swift
//  StatsWidgetsExtension
//
//  Created by Andrey Chernyshev on 01.07.2021.
//

import WidgetKit
import SwiftUI

struct SmallRateWidget: Widget {
    let placeholder = StatsContent(date: Date(),
                                   passRate: 50,
                                   testTaken: 0,
                                   testsTakenNum: 0,
                                   correctAnswers: 0,
                                   correctAnswersNum: 0,
                                   questionsTaken: 0,
                                   answeredQuestions: 0)
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "SmallRateWidget", provider: Provider(placeholder: placeholder)) { entry in
            VStack(alignment: .leading) {
                Text("Widgets.PassRate".localized)
                    .font(.system(size: 19.scale))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.make(248, green: 207, blue: 86))
                Spacer()
                Text(String(format: "%.0f%%", min(entry.passRate / 100, 1.0) * 100.0))
                    .font(.system(size: 42.scale))
                    .fontWeight(.bold)
                    .foregroundColor(Color.make(61, green: 148, blue: 245))
                Spacer(minLength: 10.scale)
                LineProgressView(progress: entry.passRate / 100,
                                 color: Color.make(61, green: 148, blue: 245))
                    .frame(height: 6.scale)
            }
            .padding(16)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Widgets.Small.Name".localized)
        .description("Widgets.Small.Description".localized)
    }
}
