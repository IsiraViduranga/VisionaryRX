import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter your email address below to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'abc123@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.teal, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
