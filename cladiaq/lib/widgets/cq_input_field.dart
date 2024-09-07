import 'package:cladiaq/commons/colors.dart';
import 'package:flutter/material.dart';
// import 'package:otp_input_editor/otp_input_editor.dart';

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
    return TextField(
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
        fillColor: cqVeryLightGreyColor,
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
