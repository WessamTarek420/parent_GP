import 'package:flutter/material.dart';

class Customadd extends StatelessWidget {
  
  final String hint;
  final IconData icon;
  final Function onclick;
  String _errorMessege(String str)
  {
    switch(hint)
    {
      case 'enter your name':return 'name is empty';
      case 'enter your email':return 'email is empty';
      case 'enter your password':return 'password is empty';
      case  'enter the product name':return 'product name is empty';
      case  'enter the product price':return 'product price is empty';
      case 'enter the product description':return 'product description is empty';
      case 'enter the product category':return'category is empty';
    }
  }

   Customadd( {@required this.onclick,@required this.hint,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty)
          {
            return _errorMessege(hint);
          }
          
          },
          onSaved: onclick,
          obscureText: hint=='enter your password'?true:false,
        cursorColor:Colors.teal[300],
        decoration:InputDecoration(
          hintText:hint,
          prefixIcon: Icon(
            icon,color: Colors.teal[300],
            
          ),
          filled: true,
          fillColor:Colors.teal[50],
          
         
         
      ),
      
    ),
    );
  }
}