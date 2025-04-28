import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String placeholder;
  const LabeledInput({super.key,required this.label,required this.placeholder});
  


  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Customize label color
            ),
          ),
          // Input field
          SizedBox(height: 8), // Spacing between label and input
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
              hintText: placeholder, // You can replace with a placeholder or hint
            ),
          ),
        ],
      )
    );
  }
}
