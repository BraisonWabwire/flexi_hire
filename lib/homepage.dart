import 'package:flexi_hire/authentication.dart';
import 'package:flexi_hire/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final PageController _controller = PageController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  bool _obsecureText = true;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await _authService.signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      // Navigation happens automatically via StreamBuilder in main.dart
    } catch (e) {
      setState(() {
        _errorMessage = 'Login failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login to your account",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/login.png', width: 150, height: 150),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          helperText: 'example@gmail.com',
                        ),
                        style: TextStyle(color: Colors.deepPurpleAccent),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecureText,
                        decoration: InputDecoration(
                          labelText: 'password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obsecureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obsecureText = !_obsecureText;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(color: Colors.deepPurpleAccent),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('form is valid');
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 5,),
              TextButton(onPressed: () {}, child: Text('Forgot password')),
              // SizedBox(height: 5,),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text("Create account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
