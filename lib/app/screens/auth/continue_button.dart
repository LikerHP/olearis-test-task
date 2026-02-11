import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    required this.isActive,
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  final bool isActive;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 42,
      child: FilledButton(
        onPressed: isActive ? onPressed : null,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll<double>(
            isActive ? 2 : 0,
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(
            isActive ? Colors.lightBlue : Colors.grey.withValues(alpha: 0.3),
          ),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                'Continue',
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                ),
              ),
      ),
    );
  }
}
