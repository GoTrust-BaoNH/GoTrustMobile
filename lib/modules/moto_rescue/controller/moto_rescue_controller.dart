import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class MotoRescueController extends BaseController {
  MotoRescueController({required this.apiRepository});

  final Infrastructure apiRepository;

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void onItemPressed() {
    // Get.toNamed(RouteList.mapScreen);
  }

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
