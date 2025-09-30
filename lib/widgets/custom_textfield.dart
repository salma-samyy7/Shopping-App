import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? topLabel; // New parameter
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? toggleObscure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.topLabel, // New parameter
    this.validator,
    this.obscureText = false,
    this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top label (optional)
          if (topLabel != null) ...[
            Text(
              topLabel!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
          ],
          // Text field
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: toggleObscure != null
                  ? IconButton(
                      icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility),
                      onPressed: toggleObscure,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}