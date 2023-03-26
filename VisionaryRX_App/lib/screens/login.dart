import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/forgotpassword.dart';
import 'package:visionaryrx/screens/pages/home.dart';
import 'package:visionaryrx/screens/root_page.dart';
import 'package:visionaryrx/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
    passwordController.addListener(validatePassword);
  }

  @override
  void dispose() {
    emailController.removeListener(validateEmail);
    passwordController.removeListener(validatePassword);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail() {
    final email = emailController.text;
    bool isEmailValid = RegExp(r'^[a-z0-9.]+@[a-z]+\.[a-z]+').hasMatch(email);
    setState(() {
      this.isEmailValid = isEmailValid;
      this.isButtonEnabled = isEmailValid && isPasswordValid;
    });
  }

  void validatePassword() {
    final password = passwordController.text;
    bool isPasswordValid = password.isNotEmpty;
    setState(() {
      this.isPasswordValid = isPasswordValid;
      this.isButtonEnabled = isEmailValid && isPasswordValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 0, bottom: 0),
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alata'),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                      height: 150,
                      child: Image.asset('assets/login.png'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 40, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'abc@gmail.com',
                  errorText: isEmailValid ? null : 'Please enter a valid email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 20, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: '********',
                  errorText: isPasswordValid ? null : 'Please enter a password',
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()),
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 0, bottom: 0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      isButtonEnabled ? () => signInWithEmailPassword() : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signInWithEmailPassword() async {
    if (emailController.text.isEmpty) {
      showSnackBar('Please enter your email');
      return;
    }

    if (passwordController.text.isEmpty) {
      showSnackBar('Please enter your password');
      return;
    }

    try {
      // sign in with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RootPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar('No user found for that email');
      } else if (e.code == 'wrong-password') {
        showSnackBar('Wrong password provided for that user');
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
