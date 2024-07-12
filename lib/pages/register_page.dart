import 'dart:convert';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:flutterinstagram/components/navigation_manu.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String error = '';
  bool loading = false;
  var response;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void submitRegistration() async {
    setState(() {
      loading = true;
      error = '';
      var url = Uri.parse('http://65.108.148.136:8085/Account/register');
      var _response = http.post(
        url,
        body: {
          'username': _usernameController.text,
          'fullname': _fullnameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'confirmPassword': _confirmPasswordController.text,
        },
      );
      _response = _response;
    });

    setState(() {
      loading = false;
    });

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavigationMenu()),
      );
    } else {
      setState(() {
        error = json.decode(response.body)['errors'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                SvgPicture.asset('images/Instagram Logo (1).svg'),
                SizedBox(height: 80),
                TextFieldContainer(
                  error: error.isNotEmpty,
                  labelText: 'Username',
                  controller: _usernameController,
                ),
                TextFieldContainer(
                  error: error.isNotEmpty,
                  labelText: 'Fullname',
                  controller: _fullnameController,
                ),
                TextFieldContainer(
                  error: error.isNotEmpty,
                  labelText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                PasswordFieldContainer(
                  labelText: 'Password',
                  controller: _passwordController,
                  error: error.isNotEmpty,
                ),
                PasswordFieldContainer(
                  labelText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isConfirm: true,
                  passwordController: _passwordController,
                  error: error.isNotEmpty,
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: submitRegistration,
                  child: Container(
                    alignment: Alignment.center,
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  ),
                ),
                SizedBox(height: 10),
                if (error.isNotEmpty)
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool error;

  const TextFieldContainer({
    Key? key,
    required this.error,
    required this.labelText,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: error ? Colors.red : Colors.grey.shade400,
              width: error ? 2 : 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error ? Colors.red : Colors.grey.shade500,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class PasswordFieldContainer extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isConfirm;
  final TextEditingController? passwordController;
  final bool error;

  const PasswordFieldContainer({
    Key? key,
    required this.labelText,
    required this.controller,
    this.isConfirm = false,
    this.passwordController,
    required this.error,
  }) : super(key: key);

  @override
  _PasswordFieldContainerState createState() => _PasswordFieldContainerState();
}

class _PasswordFieldContainerState extends State<PasswordFieldContainer> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: Colors.black,
        cursorWidth: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: widget.error ? Colors.red : Colors.grey.shade400,
              width: widget.error ? 2 : 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.error ? Colors.red : Colors.grey.shade500,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
