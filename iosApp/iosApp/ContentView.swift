import SwiftUI
import shared

class ViewController: UIViewController {

    let button = UIButton(type: .system)
    let label = UILabel()
    let bridge = ApiBridge()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        button.setTitle("Fetch Message", for: .normal)
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)

        label.numberOfLines = 0
        label.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [button, label])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }

    @objc func onButtonTap() {
        bridge.getMessage { message in
            
            DispatchQueue.main.async {
                self.label.text = message
            }
        }
    }
}


struct UIKitWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No updates needed
    }
}
