import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String dataKey;
  final String value;
  final Function handleChange;
  const LabeledInput({super.key,required this.label,required this.placeholder,required this.value,required this.handleChange,required this.dataKey});
  


  @override
  Widget build(BuildContext context) {
    return Column(
      
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
            onChanged: (text) => handleChange(dataKey, text),
            initialValue: value,
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
    );
  }
}
