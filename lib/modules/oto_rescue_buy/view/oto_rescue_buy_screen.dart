import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/oto_rescue_buy/controller/oto_rescue_buy_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/methods/common_method.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';

part 'oto_rescue_buy.children.dart';

class OtoRescueBuyScreen extends GetView<OtoRescueBuyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'oto_rescue'.tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const StepWidget(currentStepIndex: 0),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => Expanded(
                  child: Column(
                    children: buildListProduct(context),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppGradientButton(
                onPressed: controller.onBuyNowButtonPressed,
                child: Text(
                  'buy_now'.tr,
                  style: Theme.of(context).accentTextTheme.headline6,
                ),
              ),
              const SizedBox(height: 16)
            ],
          )),
    );
  }

  List<Widget> buildListProduct(BuildContext context) {
    final list = <Widget>[];
    for (var i = 0; i < controller.listProductDisplay.value.length; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 20),
          width: Get.width,
          decoration: ThemeDecoration.textFieldWithShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${'membership_fee'.tr}: ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: formatVnd(controller.listProductDisplay.value[i].price.toString()),
                      style: TextAppStyle().textPricePageMotoStyle(),
                    ),
                    TextSpan(
                      text: ' / ${'year'.tr}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '${controller.listProductDisplay.value[i].name ?? ''} - ${controller.listProductDisplay.value[i].description ?? ''}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }
}
