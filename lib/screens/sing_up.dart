import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

   @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void validate()
  {
    if(_formKey.currentState!.validate())
    {
      print("it 's okay");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: _formKey,
          child: Column(  

            children: [
                  Spacer(flex: 1,),
                  SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  color: Colors.white,
                  height: 64,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController, keyboardType: TextInputType.emailAddress, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },),
                TextFormField(controller: _fullnameController, keyboardType: TextInputType.text,),

                TextFormField(controller: _usernameController, keyboardType: TextInputType.text, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                   if (!RegExp("/([A-Za-z._])\w+/").hasMatch(value)) {
                    return "Usernames can contain characters a-z, 0-9, underscores and periods";
                  }
                  return null;
                },),
                TextFormField(controller: _passwordController, keyboardType: TextInputType.text, obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              
                ),
                SizedBox(child: TextButton(onPressed: validate, style: TextButton.styleFrom(backgroundColor: Colors.blue[600]), child: const Text("Next", style: TextStyle(color: Colors.white,))), width: double.infinity,),
                Spacer(flex: 1,),

             
           
            ],
          ),
        ),
      ),
    );
  }
}
/*  CircleAvatar(),
            Text("Ustaw zdjęcie profilowe", style: Theme.of(context).textTheme.bodyMedium,), */