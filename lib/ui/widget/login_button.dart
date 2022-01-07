import 'package:flutter/material.dart';

Widget buildSocialLoginIcon(
    {required IconData icon, required Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    ),
  );
}
