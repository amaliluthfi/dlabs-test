import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      this.onChange,
      this.onTap,
      this.readOnly,
      this.controller})
      : super(key: key);
  final String label;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool? readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChange,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          label: Text(label,
              style: GoogleFonts.roboto(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(fontWeight: FontWeight.w500),
          border: InputBorder.none),
    );
  }
}
