import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState()=> _SignupScreen(); 
    
    
  }
  class _SignupScreen extends State<SignupScreen> {
  final _formkey =  GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller =TextEditingController();
  final TextEditingController retypepassword =TextEditingController();

  bool obsecurepassword = true;
  bool obsecurerepassword = true;
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    retypepassword.dispose();
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: const Color.fromARGB(255, 241, 240, 240),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(child: 
      SizedBox.expand(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(24),
              color: Colors.deepOrange,

              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
            Center(
              child: 
              Text("Sign Up",
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
            ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: 
              Text("Please sign up to get started ",
              
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              ),
            )

          ],
        ),
      ),
      Positioned(
        top: 220,
        right: 0,
        left: 0,
        bottom: 0,
      
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 197, 192, 192),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: 
          Column(
            children: [
              Form(
                key: _formkey,
                child: 
                Column(
                  children: [
                    TextFormField(
                      controller: namecontroller,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autofillHints: [AutofillHints.name],
                      decoration: InputDecoration(
                        labelText: "NAME",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        hintText: "John snow ",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                        ),
                      ),
                      validator: (value) {
                        if (value ==null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        if(RegExp(r'[0-9]').hasMatch(value)) {
                          return "Please enter vaild name";
                        }
                        return null;
                                              },
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: [AutofillHints.email],
                      decoration: InputDecoration(
                        labelText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        hintText: "Example@gmail.com",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!value.contains("@")) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: obsecurepassword,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        hintText: "Enter your Password",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon( obsecurepassword
                          ?Icons.visibility_off
                          :Icons.visibility
                          ),
                          onPressed: () {
                            setState(() {
                              
                              obsecurepassword = !obsecurepassword;
                            });
                          },
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: retypepassword,
                      obscureText: obsecurerepassword,
                      decoration: InputDecoration(
                        labelText: "RE-TYPE PASSWORD",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        hintText: "RE-type  your Password",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(obsecurerepassword
                          ?Icons.visibility_off_rounded
                          :Icons.visibility
                          ),
                          onPressed: () {
                            setState(() {
                               obsecurerepassword = !obsecurerepassword;
                            });
                           
                          },
                           )
  
                      ),
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if(_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:Text("Account Created"),
                            ),
                            );
                            
                        
                          }
                          },
                        
                        child: const Text("SIGN UP"),
  
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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
