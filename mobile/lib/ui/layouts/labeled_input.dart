import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
              color: Colors.black, 
            ),
          ),
          // Input field
          SizedBox(height: 8), 
          PlatformTextFormField(
            material: (_, __) => MaterialTextFormFieldData(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide()
                ),
                contentPadding: EdgeInsets.all(12),
                hintText: placeholder, 
              ),
            ),
            cupertino: (_, __) => CupertinoTextFormFieldData(
              placeholder: placeholder,
              padding: EdgeInsets.all(12),
            ),
          ),
        ],
      )
    );
  }
}
