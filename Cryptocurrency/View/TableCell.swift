//
//  TableCell.swift
//  Cryptocurrency
//
//  Created by Tanveer Bashir on 12/4/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    var currency: Currency? {
        didSet{
            updateCell()
        }
    }

    private func updateCell() {
        guard let currency = self.currency else { return }
        guard let timestamp =  Double(currency.lastUpdated) else{ return }
        nameLabel.text = currency.name
        rankLabel.text = "Rank: \(currency.rank ?? "0")"
        symbolLabel.text = currency.symbol
        priceUsdLabel.text = "$ \(currency.priceUsd ?? "0.00")"
        lastUpdated.text = "Updated on: \(dateStringFromUnix(timestamp))"
        currencyLogo.image = UIImage(named: "\(currency.symbol.lowercased())")
        precentChangein24HrsLabel.textColor = currency.percentChange24h.contains("-") ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        precentChangein7DayLabel.textColor = currency.percentChange7d.contains("-") ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

        precentChangein24HrsLabel.attributedText = attributedStringAt(location: 0, length: 4, str: "24h: \(currency.percentChange24h!)%")
        precentChangein7DayLabel.attributedText =  attributedStringAt(location: 0, length: 3, str: "7d: \(currency.percentChange7d!)%")
    }

    private func dateStringFromUnix(_ timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "MMM dd, yyyy '@' hh:mm a"
        return formatter.string(from: date)
    }

    func attributedStringAt(location: Int, length: Int, str: String ) -> NSAttributedString {
        let attributedStr = NSMutableAttributedString(string: str)
        let range = NSRange(location: location, length: length)
        attributedStr.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], range: range)
        return attributedStr
    }

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var priceUsdLabel: UILabel!
    @IBOutlet private weak var precentChangein24HrsLabel: UILabel!
    @IBOutlet private weak var precentChangein7DayLabel: UILabel!
    @IBOutlet private weak var lastUpdated: UILabel!
    @IBOutlet private weak var currencyLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        currencyLogo.layer.cornerRadius = currencyLogo.bounds.height / 2
        currencyLogo.clipsToBounds = true
        backView.layer.borderWidth = 1
        backView.layer.cornerRadius = 5
        backView.layer.borderColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
    }
}

extension TableCell {
    static var id: String {
        return String(describing: self)
    }

    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
