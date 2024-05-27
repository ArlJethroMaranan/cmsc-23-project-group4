import 'package:flutter/material.dart';

class TextFieldState extends StatefulWidget {
  final dynamic hintText; //to accept string to widget
  final dynamic label;
  final Function(String) addToValuesList;

  const TextFieldState({
    Key? key,
    required this.hintText,
    required this.label,
    required this.addToValuesList,
  });

  @override
  State<TextFieldState> createState() => _TextFieldStateState();
}

class _TextFieldStateState extends State<TextFieldState> {
  String? inputValue = "";

  @override
  Widget build(BuildContext context) {

    return FormField(
      initialValue: inputValue,
      builder: (FormFieldState<String> state){
      return Column(
        children: [
          TextFormField(
            validator: (value) { //check if not empty or null
              if (value == null || value.isEmpty) {
                return "No empty strings allowed";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                inputValue = value;
                widget.addToValuesList(value); 
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.hintText,
              labelText: widget.label,
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
      }
    );
  }
}