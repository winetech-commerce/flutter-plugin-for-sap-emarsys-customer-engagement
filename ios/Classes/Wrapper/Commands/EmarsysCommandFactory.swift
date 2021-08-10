//
// Created by Emarsys on 2021. 04. 22..
//
import EmarsysSDK

class EmarsysCommandFactory {
    
    var pushEventHandler: EMSEventHandlerBlock
    var silentPushEventHandler: EMSEventHandlerBlock
    
    init(pushEventHandler: @escaping EMSEventHandlerBlock, silentPushEventHandler: @escaping EMSEventHandlerBlock) {
        self.pushEventHandler = pushEventHandler
        self.silentPushEventHandler = silentPushEventHandler
    }

    func create(name: String) -> EmarsysCommandProtocol? {
        var result: EmarsysCommandProtocol?
        switch name {
        case "setup":
            result = SetupCommand(pushEventHandler: self.pushEventHandler, silentPushEventHandler: self.silentPushEventHandler)
        case "setContact":
            result = SetContactCommand()
        case "clearContact":
            result = ClearContactCommand()
        case "push.pushSendingEnabled":
            result = PushSendingEnabledCommand()
        case "push.android.registerNotificationChannels":
            result = EmptyCommand()
        case "config.applicationCode":
            result = ApplicationCodeCommand()
        case "config.merchantId":
            result = MerchantIdCommand()
        case "config.contactFieldId":
            result = ContactFieldIdCommand()
        case "config.hardwareId":
            result = HardwareIdCommand()
        case "config.languageCode":
            result = LanguageCodeCommand()
        case "config.notificationSettings":
            result = NotificationSettingsCommand()
        case "config.sdkVersion":
            result = SdkVersionCommand()
        case "config.changeApplicationCode":
            result = ChangeApplicationCodeCommand()
        default:
            result = nil
        }
        return result
    }

}
