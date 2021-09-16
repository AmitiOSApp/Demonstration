
import Foundation
import SwiftMessages

protocol InAppMessagePresenterType{
    func show_(type:InAppMessageType, title:String, body:String)
}

enum InAppMessageType {
    case info
    case success
    case warning
    case error
}

extension InAppMessagePresenterType {
    func show(type:InAppMessageType = .info, title:String? = nil, body:String? = nil){
        show_(type: type, title: title ?? "", body: body ?? "")
    }
}

private extension InAppMessageType {
    var theme: Theme {
        switch self {
        case .info:
            return .info
        case .success:
            return .success
        case .warning:
            return .warning
        case .error:
            return .error
        }
    }
}

struct SwiftMessageInAppMessagePresenter: InAppMessagePresenterType {
    static let `default` = SwiftMessageInAppMessagePresenter()
    
    func show_(type: InAppMessageType, title: String, body: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body)
        view.configureTheme(type.theme, iconStyle: .subtle)
        view.configureDropShadow()
        
        view.button?.isHidden = true
//        var config = SwiftMessages.Config()
//
//        config.presentationStyle = .top
//        config.duration = .seconds(seconds: 1.5)
//        config.interactiveHide = true
//
//        SwiftMessages.show(config: config, view: view)
        SwiftMessages.show(view: view)
    }
}

extension UIViewController {
    var ext_messages:InAppMessagePresenterType {
        return SwiftMessageInAppMessagePresenter.default
    }
}
