import 'dart:developer';
import 'package:auth_app/utils/local_images.dart';
import 'package:auth_app/utils/strings_en.dart';
import 'package:auth_app/widget/otp_field_widget.dart';
import 'package:flutter/material.dart';
import '../extension/context_extension.dart';
import '../widget/primary_button_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercentage(5),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                Text(
                  StringsEn.otpVerify,
                  style:
                      context.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                Image.asset(
                  LocalImages.otp,
                  height: context.heightPercentage(30),
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  StringsEn.otpSentTo,
                  textAlign: TextAlign.center,
                  style: context.bodyMedium?.copyWith(
                    color: context.greyColor,
                  ),
                ),
                Text(
                  "+91 12345 67890",
                  textAlign: TextAlign.center,
                  style: context.bodyMedium?.copyWith(
                    color: context.greyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                OtpFieldWidget(
                  length: 4,
                  onComplete: (String result) {
                    log("Entered OTP is: $result");
                  },
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                PrimaryButtonWidget(
                  title: StringsEn.verifyOtp,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => SimpleDialog(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: context.heightPercentage(5),
                            horizontal: context.widthPercentage(5)),
                        children: const [
                          Text(StringsEn.otpSuccessMsg),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                Text(
                  StringsEn.termsAndConditions,
                  textAlign: TextAlign.center,
                  style: context.bodyMedium?.copyWith(
                    color: context.greyColor,
                  ),
                ),
                SizedBox(
                  height: context.heightPercentage(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
