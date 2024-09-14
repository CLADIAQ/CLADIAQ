import 'package:cladiaq/commons/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CqInputField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool otp;

  const CqInputField(
      {Key? key,
      required this.controller,
      this.placeholder = '',
      this.password = false,
      this.leading,
      this.trailing,
      this.otp = false})
      : super(key: key);

  @override
  State<CqInputField> createState() => _CqInputFieldState();
}

class _CqInputFieldState extends State<CqInputField> {
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.password; // Initialize here
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.otp
        ? OtpTextField(
            fieldHeight: 65,
            fieldWidth: 62,
            numberOfFields: 4,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            borderColor: Colors.black,
            focusedBorderColor: cqMediumGreyColor,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Text("Verification Code"),
                    );
                  });
            }, // end onSubmit
          )
        : TextField(
            controller: widget.controller,
            style: const TextStyle(height: 1.5),
            obscureText: _isObscured, // Use the state variable here
            decoration: InputDecoration(
              hintText: widget.placeholder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              prefixIcon: widget.leading,
              suffixIcon: widget.password // Show toggle only for password field
                  ? GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                    )
                  : widget.trailing,
              fillColor: Colors.white,
              border: circularBorder.copyWith(
                  borderSide: const BorderSide(color: cqLightGreyColor)),
              errorBorder: circularBorder.copyWith(
                  borderSide: const BorderSide(color: cqDanger)),
              focusedBorder: circularBorder.copyWith(
                  borderSide: const BorderSide(color: cqMediumGreyColor)),
              enabledBorder: circularBorder.copyWith(
                  borderSide: const BorderSide(color: cqLightGreyColor)),
            ),
          );
  }
}
