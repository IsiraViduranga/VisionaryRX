import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 25, bottom: 0),
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alata'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding( //chgdfhgfgfhfghsf
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 40, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    hintText: 'Enter your full name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // Register user logic goes here
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Your sign in logic goes here
                  },
                  child: const Text(
                    'Sign In',
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