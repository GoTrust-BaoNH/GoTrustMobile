import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class UserInfoScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
                width: width,
              ),
              Text(
                'input_info'.tr,
                style: TextAppStyle().titlePageTextStyle(),
              ),
              const SizedBox(height: 12),
              Text(
                'input_info_follow'.tr,
                style: TextAppStyle().contentPageTextStyle(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'help_buy_faster'.tr,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.primaryHintColorLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              InputWidget(
                hint: 'input_name'.tr,
                lable: 'name'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_phone'.tr,
                lable: 'phone'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_private_id'.tr,
                lable: 'private_id'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_email'.tr,
                lable: 'email'.tr,
              ),
              const SizedBox(height: 32),
              AppGradientButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Text(
                  'confirm'.tr,
                  style: TextAppStyle().textEnableButtonStyle(),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  'enter_late'.tr,
                  style: TextAppStyle().textClickColorStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
