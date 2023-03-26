import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/forgotpassword.dart';
import 'package:visionaryrx/screens/pages/home.dart';
import 'package:visionaryrx/screens/root_page.dart';
import 'package:visionaryrx/screens/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
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
                      height: 180,
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen()));
                },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const RootPage()
                    ));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
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
}