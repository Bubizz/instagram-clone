import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/services/auth_methods.dart';
import 'package:instagram/services/db_methods.dart';

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
  bool _showUsernameTakenMsg = false;

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void createUser() async {
    var _username = _usernameController.text;

    bool isAvailable;

    try {

      isAvailable = await dbMethods().isUsernameAvailable(_username);

      if (isAvailable) {

        await AuthMethods().signup(_usernameController.text, _fullnameController.text,  _emailController.text, _passwordController.text);

      } else {
        setState(() {
          _showUsernameTakenMsg = true;
        });
      }
    } on Exception catch (e)
    {
      if(e.toString() == "Exception: email is already in use")
      {
        var snackBar = SnackBar(
        content: const Text('E-mail is already taken'),
        backgroundColor: Colors.green[600],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    

      }
    }
    catch (e) {
      var snackBar = SnackBar(
        content: const Text('Something went wrong'),
        backgroundColor: Colors.green[600],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void validate() {
    if (_formKey.currentState!.validate()) {
      createUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) => 
               SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Center(
                      child: Column(
                        children: [             
                          Center(
                            child: SvgPicture.asset(
                              'assets/ic_instagram.svg',
                              color: Colors.white,
                              height: 64,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                               contentPadding: const EdgeInsets.all(5.0),
                                border: inputBorder,
                                hintText: 'E-mail',
                                fillColor:
                                    ThemeData.dark().inputDecorationTheme.fillColor,
                                filled: true),
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
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: inputBorder,
                                hintText: 'Fullname',
                                fillColor:
                                    ThemeData.dark().inputDecorationTheme.fillColor,
                                filled: true),
                            controller: _fullnameController,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: inputBorder,
                                hintText: 'Username',
                                fillColor:
                                    ThemeData.dark().inputDecorationTheme.fillColor,
                                filled: true),
                            controller: _usernameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                              
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            child: const Text(
                              "Username is already taken",
                              style: TextStyle(
                                  fontSize: 14, color: Color.fromARGB(255, 218, 96, 137)),
                            ),
                            visible: _showUsernameTakenMsg,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: inputBorder,
                              hintText: 'Password',
                              fillColor: ThemeData.dark().inputDecorationTheme.fillColor,
                              filled: true,
                            ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: TextButton(
                                onPressed: validate,
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue[600]),
                                child: const Text("Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))),
                            width: double.infinity,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*  CircleAvatar(),
            Text("Ustaw zdjęcie profilowe", style: Theme.of(context).textTheme.bodyMedium,), */