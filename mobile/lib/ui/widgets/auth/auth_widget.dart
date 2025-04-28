import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import '../../layouts/labeled_input.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 110,),
      

      child:Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 24),
      
      
      child: Column(
        children: [
          Text(
            'Batal',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
          Padding(padding: const EdgeInsets.only(bottom: 56)),
          Text(
            'Create an account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            ),
          Text(
            'Enter your email to sign up for this app',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            ),
          Padding(padding: const EdgeInsets.only(bottom: 24)),
           
          LabeledInput(label:'Email',placeholder: 'email@domain.com'),
          Padding(padding: const EdgeInsets.only(bottom: 32)),
          SizedBox(
            
            child: Row(
            
            children: [
              Expanded(child: Divider(color: Colors.grey.shade300,thickness: 1)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: Text('OR',style: TextStyle(color: Colors.grey.shade500),),),
              Expanded(child: Divider(color: Colors.grey.shade300,thickness: 1)),
            ],
          ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 24)),
          Row(children: [
            Expanded(
            child: TextButton.icon(
            onPressed: (){},
            icon: Icon(Icons.gamepad),
            label:Text('continue with google'),
            style: TextButton.styleFrom(
              backgroundColor: bg_gray,
              foregroundColor: secondaryColor,
              iconColor: secondaryColor,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8))),
            )
          )
          ]),
          //end of 1st row

          Row(children: [
            Expanded(
            child: TextButton.icon(
            onPressed: (){},
            icon: Icon(Icons.gamepad),
            label:Text('continue with Apple'),
            style: TextButton.styleFrom(
              backgroundColor: bg_gray,
              foregroundColor: secondaryColor,
              iconColor: secondaryColor,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8))),
            )
            )
          ],
          
          
          ),
          //end of 2nd row
          Padding(padding: const EdgeInsets.only(bottom: 24)),
          RichText(
            textAlign:TextAlign.center,
            text: TextSpan(
            
            children: <TextSpan>[
              TextSpan(
                
                text: 'By clicking continue, you agree to our ',
                style: TextStyle(fontWeight: FontWeight.bold, color: text_gray),
              ),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),
              ),
              TextSpan(
                text: 'and ',
                style: TextStyle(fontWeight: FontWeight.bold, color: text_gray),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),
              ),
              
        ]
          ))
          ],
          

      ) ,
      
    ));
  }
}