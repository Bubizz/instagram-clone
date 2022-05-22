import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/services/auth_methods.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback goToSignIn;
  const SignUpScreen({Key? key, required this.goToSignIn}) : super(key: key);

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

  void validate() async {
    if (_formKey.currentState!.validate()) {
      try {
        await AuthMethods()
            .signup(_emailController.text, _passwordController.text);
      } catch (e) {
        var snackBar = SnackBar(
        content: Text(e.toString())
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
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
              const Spacer(
                flex: 1,
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: Colors.white,
                height: 64,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fullnameController,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                child: TextButton(
                    onPressed: validate,
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[600]),
                    child: const Text("Next",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                width: double.infinity,
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Alredy have an account? ',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => widget.goToSignIn(),
                    child: Container(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*  CircleAvatar(),
            Text("Ustaw zdjęcie profilowe", style: Theme.of(context).textTheme.bodyMedium,), */