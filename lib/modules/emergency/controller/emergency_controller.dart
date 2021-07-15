import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/emergency/emergency_model.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class EmergencyController extends BaseController {
  EmergencyController({required this.apiRepository});

  final ApiRepository apiRepository;

  List<EmergencyModel> list = [
    EmergencyModel(serviceName: 'Service 1', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 2', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 3', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 4', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 1', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 2', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 3', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 4', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 1', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 2', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 3', servicePhoneNumber: '1800xxxx'),
    EmergencyModel(serviceName: 'Service 4', servicePhoneNumber: '1800xxxx'),
  ];

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void notificationButtonPressed() {}

  void menuButtonPressed() {}

  void onItemListServicePressed(EmergencyModel item) {}

  void onChatButtonPressed() {}

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  void handleEventDialog(String? defineEvent) {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        checkConnectNetwork();
        break;
      case Unknown_Error:
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}