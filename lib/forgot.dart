import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState(); 
    
  }
  class _ForgotpasswordState extends State<Forgotpassword> {

  
    final  _formkey = GlobalKey<FormState>();
    final TextEditingController emailController =TextEditingController();
    @override
    void dispose() {
      emailController.dispose();
      super.dispose();
    }
      @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(child: SizedBox.expand(child: 
       Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding:const  EdgeInsets.all(24),
            color: Colors.deepOrange,

            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: 
                  Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 24,
                    fontWeight:FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                ),
                SizedBox(height: 20),
                Center(
                 
                  child:
                  Text(
                    "Please  sign in to your existing account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white              
                            ),
                  ),
                ),
            

              ],
            ),

            ),
            Positioned(
              top: 200,
              right: 0,
              left: 0,
              bottom: 0,

            child:   Container(
               padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formkey,
                child: Column(
                  children:[
                    TextFormField(
                      controller:emailController,
                      keyboardType:TextInputType.emailAddress,
                      textInputAction:TextInputAction.next,
                      autofillHints:[AutofillHints.email],
                      decoration:InputDecoration(
                        labelText: "EMAIL",
                        hintText: "example@gmail.com",
                        filled:true,
                        fillColor: Colors.grey.shade200,
                        border:OutlineInputBorder
                        (borderRadius:BorderRadius.circular(12),
                        borderSide:BorderSide.none,
                        ),
                      ),
                      validator :(value) {
                        if (value==null || value.isEmpty) {
                           return "Please enter email";
                        }
                        if (!value.contains("@")) {
                          return " Enter vaild email";
                        }
                        return null;

                      },
                    ),
                    const SizedBox(height:50),
                    SizedBox(
                      width:double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(16),
                          ),

                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                content:  const Text(
                                "Code Sent" ,
                                style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold, 
                                  ),
                                   ),
                                    backgroundColor: const Color.fromARGB(255, 74, 255, 34), 
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(12),
                                
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                            );
                          }
                        },
                        child: Text(
                          "SEND CODE"
                      ),
                      ),
                      
                    ),
                    
                    
                  ],
                ),
                ),
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

