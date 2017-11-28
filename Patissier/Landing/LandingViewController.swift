//
//  LandingViewController.swift
//  Patissier
//
//  Created by Roy Hsu on 25/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - LandingViewController

import UIKit

class LandingViewController: UIViewController {

    // MARK: Property

    @IBOutlet private(set) weak var backgroundImageView: UIImageView!

    @IBOutlet private(set) weak var backgroundGradientView: UIView!

    let backgroundGradientLayer = CAGradientLayer()

    @IBOutlet private(set) weak var logoLabel: UILabel!

    @IBOutlet private(set) weak var signInWithFacebookButton: UIButton!

    // MARK: Appearance

    override var prefersStatusBarHidden: Bool { return true }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBackgroundImageView()

        setUpBackgroundGradientView()

        setUpLogoLabel()

        setUpSignInWithFacebookButton()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        backgroundGradientLayer.frame = backgroundGradientView.bounds

    }

    // MARK: Set Up

    private func setUpBackgroundImageView() {

        backgroundImageView.contentMode = .scaleAspectFill

        backgroundImageView.image = UIImage(named: "image-landing")

    }

    private func setUpBackgroundGradientView() {

        backgroundGradientView.alpha = 0.85

        let layer = backgroundGradientLayer

        layer.colors = [
            UIColor(red: 3.0 / 255.0, green: 63.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0).cgColor,
            UIColor(red: 4.0 / 255.0, green: 107.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
        ]

        layer.endPoint = CGPoint(x: 0.5, y: 1.0)

        layer.startPoint = CGPoint(x: 0.5, y: 0.0)

        backgroundGradientView.layer.insertSublayer(layer, at: 0)

    }

    private func setUpLogoLabel() {

        let label = logoLabel!

        label.font = UIFont(name: "Georgia-Bold", size: 50.0)

        label.text = NSLocalizedString(
            "Pâtissier",
            comment: ""
        )

        label.textAlignment = .center

        label.textColor = .white

        label.layer.shadowColor = UIColor.black.cgColor

        label.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        label.layer.shadowOpacity = 0.5

        label.layer.shadowRadius = 2.0

    }

    func setUpSignInWithFacebookButton() {

        // Style

        let button = signInWithFacebookButton!

        button.backgroundColor = UIColor(
            red: 255.0 / 255.0,
            green: 53.0 / 255.0,
            blue: 71.0 / 255.0,
            alpha: 1.0
        )

        button.contentEdgeInsets = UIEdgeInsets(
            top: 12.0,
            left: 10.0,
            bottom: 12.0,
            right: 10.0
        )

        button.titleLabel!.font = UIFont.systemFont(
            ofSize: 16.0,
            weight: UIFont.Weight.semibold
        )

        button.setTitle(
            NSLocalizedString(
                "Sign In with Facebook",
                comment: ""
            ),
            for: .normal
        )

        button.setTitleColor(.white, for: .normal)

        button.layer.cornerRadius = 2.0

        button.layer.shadowColor = UIColor(
                red: 3.0 / 255.0,
                green: 63.0 / 255.0,
                blue: 122.0 / 255.0,
                alpha: 1.0
            )
            .cgColor

        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        button.layer.shadowOpacity = 1.0

        button.layer.shadowRadius = 10.0

        // Action

        button.addTarget(self, action: .signInWithFacebook, for: .touchUpInside)

    }

    // MARK: Action

    @objc func signInWithFacebook(_ sender: Any) {

        let errorHandler: (Error) -> Void = { error in

            let alert = UIAlertController(
                title: NSLocalizedString(
                    "Something went wrong",
                    comment: ""
                ),
                message: error.localizedDescription,
                preferredStyle: .alert
            )

            let ok = UIAlertAction(
                title: NSLocalizedString(
                    "OK",
                    comment: ""
                ),
                style: .cancel,
                handler: nil
            )

            alert.addAction(ok)

            self.present(alert, animated: true, completion: nil)

        }

        requestPermissionGroup(
            .read(
                required: [ .publicProfile, .email ]
            ),
            success: { facebook in

                let client = APIClient()

                client.signInWithFacebook(
                    token: facebook.token.tokenString!,
                    success: { appToken in

                        do {

                            try appToken.save(to: .appToken)

                            try UserManager.shared.restore(from: .appToken)

                            let tabBarController = TabBarController(
                                itemTypes: [ .store, .profile ]
                            )

                            AppDelegate.shared.window?.updateRoot(
                                to: tabBarController,
                                animation: crossDissolve,
                                completion: nil
                            )

                        } catch { errorHandler(error) }

                    }, failure: errorHandler

                )

            },
            failure: errorHandler
        )

    }

}

// MARK: - Selector

private extension Selector {

    static let signInWithFacebook = #selector(LandingViewController.signInWithFacebook)

}
