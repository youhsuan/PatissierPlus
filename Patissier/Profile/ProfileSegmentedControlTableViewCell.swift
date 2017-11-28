//
//  ProfileSegmentedControlTableViewCell.swift
//  Patissier
//
//  Created by Roy Hsu on 27/08/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - ProfileSegmentedControlTableViewCellDelegate

protocol ProfileSegmentedControlTableViewCellDelegate: class {

    func cell(_ cell: ProfileSegmentedControlTableViewCell, didSelect segment: ProfileSegmentedControlTableViewCell.Segment)

}

// MARK: - ProfileSegmentedControlTableViewCell

import UIKit

class ProfileSegmentedControlTableViewCell: UITableViewCell {

    // MARK: Segment

    enum Segment {

        // MARK: Case

        case left, right

    }

    // MARK: Property

    weak var delegate: ProfileSegmentedControlTableViewCellDelegate?

    var selectedSegment: Segment = .left {

        didSet {

            guard
                let leftButton = leftButton,
                let rightButton = rightButton
                else { return }

            switch selectedSegment {

            case .left:

                leftButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)

                rightButton.backgroundColor = .clear

            case .right:

                leftButton.backgroundColor = .clear

                rightButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)

            }

            delegate?.cell(
                self,
                didSelect: selectedSegment
            )

        }

    }

    var leftTitle: String? {

        didSet {

            guard
                let button = leftButton
                else { return }

            button.setTitle(
                leftTitle,
                for: .normal
            )

        }

    }

    @IBOutlet private weak var leftButton: UIButton!

    var rightTitle: String? {

        didSet {

            guard
                let button = rightButton
                else { return }

            button.setTitle(
                rightTitle,
                for: .normal
            )

        }

    }

    @IBOutlet private weak var rightButton: UIButton!

    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpBackgroundView()

        setUpLeftButton()

        setUpRightButton()

    }

    // MARK: Set Up

    private func setUpBackgroundView() {

        let view = contentView

        view.backgroundColor = UIColor(
            red: 255.0 / 255.0,
            green: 94.0 / 255.0,
            blue: 89.0 / 255.0,
            alpha: 1.0
        )

    }

    private func setUpLeftButton() {

        let button = leftButton!

        button.addTarget(
            self,
            action: #selector(leftDidSelect),
            for: .touchUpInside
        )

        button.setTitle(
            leftTitle,
            for: .normal
        )

        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)

        button.layer.cornerRadius = 4.0

        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)

    }

    private func setUpRightButton() {

        let button = rightButton!

        button.addTarget(
            self,
            action: #selector(rightDidSelect),
            for: .touchUpInside
        )

        button.setTitle(
            rightTitle,
            for: .normal
        )

        button.backgroundColor = .clear

        button.layer.cornerRadius = 4.0

        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)

    }

    @objc func leftDidSelect(_ sender: Any) {

        selectedSegment = .left

    }

    @objc func rightDidSelect(_ sender: Any) {

        selectedSegment = .right

    }

}
