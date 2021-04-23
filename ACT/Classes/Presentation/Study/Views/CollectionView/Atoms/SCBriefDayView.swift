//
//  SCBriefDayView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 13.02.2021.
//

import UIKit

final class SCBriefDayView: UIView {
    lazy var weekdayLabel = makeWeekdayLabel()
    lazy var dayLabel = makeDayLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 35.scale, height: 58.scale)
    }
}

// MARK: API
extension SCBriefDayView {
    func setup(day: SCEBrief.Day) {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "EEE"
        weekdayLabel.text = formatter.string(from: day.date)
        
        formatter.dateFormat = "dd"
        dayLabel.text = formatter.string(from: day.date)
        
        weekdayLabel.alpha = day.activity ? 1 : 0.3
        dayLabel.alpha = day.activity ? 1 : 0.3
    }
}

// MARK: Make constraints
private extension SCBriefDayView {
    func makeConstrains() {
        NSLayoutConstraint.activate([
            weekdayLabel.topAnchor.constraint(equalTo: topAnchor),
            weekdayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dayLabel.widthAnchor.constraint(equalToConstant: 35.scale),
            dayLabel.heightAnchor.constraint(equalToConstant: 35.scale),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension SCBriefDayView {
    func makeWeekdayLabel() -> UILabel {
        let view = UILabel()
        view.font = Fonts.SFProRounded.semiBold(size: 13.scale)
        view.textColor = UIColor(integralRed: 14, green: 0, blue: 43)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeDayLabel() -> PaddingLabel {
        let view = PaddingLabel()
        view.leftInset = 0
        view.rightInset = 0
        view.topInset = 0
        view.bottomInset = 0
        view.textAlignment = .center
        view.layer.cornerRadius = 17.5.scale
        view.layer.masksToBounds = true
        view.textColor = UIColor.white
        view.backgroundColor = UIColor(integralRed: 198, green: 54, blue: 136)
        view.font = Fonts.SFProRounded.semiBold(size: 17.scale)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
