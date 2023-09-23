import 'package:auth_app/screens/otp_screen.dart';
import 'package:auth_app/utils/local_images.dart';
import 'package:auth_app/utils/strings_en.dart';
import 'package:flutter/material.dart';
import '../extension/context_extension.dart';
import '../widget/primary_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final List<String> _countryCodeList = ["+91", "+92", "+93"];
  String? _selectedValue = "+91";

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
                  StringsEn.logIn,
                  style:
                      context.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                Image.asset(
                  LocalImages.logIn,
                  height: context.heightPercentage(30),
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: context.heightPercentage(10),
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: false),
                  maxLength: 10,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: context.inputFilledColor,
                      counterText: "",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          context.widthPercentage(10),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: context.primaryColor ?? Colors.deepOrange,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          context.widthPercentage(10),
                        ),
                      ),
                      hintText: StringsEn.phoneNumber,
                      hintStyle: TextStyle(
                          color: context.lightTextColor, fontSize: 14),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: context.widthPercentage(5),
                      ),
                      isDense: true,
                      prefixIcon: Padding(
                        padding:
                            EdgeInsets.only(left: context.widthPercentage(5)),
                        child: DropdownButton(
                            value: _selectedValue,
                            underline: const SizedBox(),
                            items: _countryCodeList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            }),
                      ),
                      prefixIconConstraints: BoxConstraints(
                          minWidth: context.widthPercentage(15))),
                ),
                SizedBox(
                  height: context.heightPercentage(5),
                ),
                PrimaryButtonWidget(
                  title: StringsEn.getOtp,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OtpScreen()));
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
