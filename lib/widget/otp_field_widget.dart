import 'package:auth_app/extension/context_extension.dart';
import 'package:flutter/material.dart';

class OtpFieldWidget extends StatefulWidget {
  final int length;
  final Function(String) onComplete;

  const OtpFieldWidget({
    Key? key,
    required this.length,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<OtpFieldWidget> createState() => _OtpFieldWidgetState();
}

class _OtpFieldWidgetState extends State<OtpFieldWidget> {
  List<TextEditingController> controllerList = <TextEditingController>[];
  List<FocusNode> focusNodeList = <FocusNode>[];
  String _otp = "";

  @override
  void initState() {
    controllerList.addAll([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    focusNodeList.addAll([
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthPercentage(100),
      child: Row(
        children: List<Widget>.generate(
          widget.length,
          (index) => Expanded(
            child: generateInputField(index),
          ),
        ),
      ),
    );
  }

  Widget generateInputField(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controllerList[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
        textInputAction: index == widget.length - 1
            ? TextInputAction.done
            : TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        focusNode: focusNodeList[index],
        onChanged: (value) {
          if (value.length == 1 && index != widget.length - 1) {
            _otp += value;
            FocusScope.of(context).requestFocus(focusNodeList[index + 1]);
          } else if (value.isEmpty && index != 0) {
            FocusScope.of(context).requestFocus(focusNodeList[index - 1]);
          }
        },
        onFieldSubmitted: (value) {
          if (index == widget.length - 1) {
            controllerList.map((e) => e.text += _otp);
          }
          _otp += value;
          widget.onComplete(_otp);
        },
        showCursor: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.inputFilledColor,
          counterText: "",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.widthPercentage(5)),
              borderSide: BorderSide(
                width: 2,
                color: context.primaryColor ?? Colors.deepOrange,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.widthPercentage(5)),
          ),
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          isDense: true,
        ),
      ),
    );
  }
}
