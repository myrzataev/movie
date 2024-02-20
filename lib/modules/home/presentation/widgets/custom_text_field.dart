
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String text) onChanged;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: SizedBox(
        height: 50,
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: onChanged ,
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            
            contentPadding: EdgeInsets.only(bottom: 25),
            prefixIconColor: Colors.white60,
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Color(0xff252836),
            hintText: "Searc a title..",
            hintStyle: TextStyle(
              color: Colors.white60,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
          ),
        ),
      ),
    );
  }
}
