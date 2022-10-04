import 'package:dre/screens/auth_screen.dart';
import 'package:dre/screens/forget.dart';
import 'package:dre/services/auth.dart';
import 'package:dre/widgets/components.dart';
import 'package:flutter/material.dart';
class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key? key, required this.authType, } ) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

var emailcontroller=TextEditingController();
var passcontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthBase authBase=AuthBase();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
          child: Column(
            children: <Widget>[
              TextFormField(controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: ' test@gmail.com',
                ),
           //      onChanged: (value) {
           // _email= value ;
           //      },
                validator: (value) =>
                value!.isEmpty ? 'You must enter a valid email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(controller: passcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                ),
                obscureText: true,
                // onChanged: (value) {
                //   _password = value;
                // },
                validator: (value) => value!.length <= 6
                    ? 'Your password must be larger than 6 characters'
                    : null,
              ),

              SizedBox(height: 40,),
              Button(text: widget.authType==AuthType.SignIn?'SignIn':'SignUp', onPressed:()async{
                if(_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.SignIn) {
                    await authBase.loginWithEmailAndPassword(emailcontroller.text, passcontroller.text);
                    Navigator.of(context).pushReplacementNamed('home');
                    print(emailcontroller.text);
                    print(passcontroller.text);
                  }
                  else {
                    await authBase.registerWithEmailAndPassword(emailcontroller.text, passcontroller.text);
                    Navigator.of(context).pushReplacementNamed('home');
                    print(emailcontroller.text);
                    print(passcontroller.text);
                  }
                }
              } ,
                  // print(emailcontroller.text);
                  // print(passcontroller.text);
                  color: Colors.cyan, textColor: Colors.white),
              FlatButton(onPressed: (){
                if(widget.authType==AuthType.SignIn)
                  Navigator.of(context).pushReplacementNamed('SignUp');
                else
                  Navigator.of(context).pushReplacementNamed('SignIn');
              }, child:
              Text( widget.authType==AuthType.SignIn?'Don\'t have an account?':'You have an account',
                style: TextStyle(fontSize: 20),)),

              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Forget() ));}, child: Text('forget password'))]



    )));
  }
}
