import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.labelText,
    required this.onChanged,
    super.key,
  });

  final String labelText;
  final Function(String) onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode focusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onChanged: widget.onChanged,
      cursorColor: Colors.lightBlue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: isFocused ? Colors.lightBlue : Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),
    );
  }

  void _focusNodeListener() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }
}
