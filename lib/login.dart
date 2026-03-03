import 'package:flutter/material.dart';
import 'forgot.dart';
import 'signup.dart';
import 'medicine_list.dart';
class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
  State<LoginScreen> createState()=> _LoginScreen(); 
    
  }
  class _LoginScreen extends State<LoginScreen>
  
{
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool obscurepassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          
          
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
        ),
       


        body: SafeArea(child: 
        SizedBox.expand(child: 
          Stack(
         
          children: [
           
               Container(
                
                height: 250,
                 width: double.infinity,
                  padding: const EdgeInsets.all(24),
                   color: Colors.orange,
                   
             
                
            
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: 
                Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
              ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: 
                  Text(
                    "Please  sign in to your  existing account. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  ),
              
              

            ],
          ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 0,
            
            
             child: Container(          
          
          
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                  
                 ),

              ),
              child: SingleChildScrollView(
                child : Column(
                  children: [
            
            
             Form(
              key: _formkey,
              child: Column(
                children: [
                 
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: [AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "example123@gmail.com",
                       filled: true,
                            fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,),
                      ),
                      
                      validator: (value) {
                        if(value ==null || value.isEmpty)
                        {
                          return "please enter email";
                        }
                        if (!value.contains("@")) {
                          return "Enter vaild email";
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 33),

                    TextFormField(
                      controller: passwordController,
                      obscureText: obscurepassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                          ),
                        
                        suffixIcon: IconButton(
                          icon: Icon(
                           obscurepassword
                            ? Icons.visibility_off
                            :Icons.visibility
                          ),
                          onPressed: () {
                            setState(() {
                              obscurepassword = !obscurepassword;
                            });
                          },
                         
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        if (value.length<6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 33),
                    Row(
                      children: [
                        Checkbox(value: 
                        rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                        ),
                        const Text("Remember Me",style: TextStyle(color: Colors.deepPurple),),
                      
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: 
                    TextButton(onPressed: () {
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>Forgotpassword(),
                       ),
                      );
                    },

                     child: const Text("Forgot Password?"),
                     ),
                    ),
                      ],
                    ),
                ],
              ),
             ),
              SizedBox(height: 33),
            

                    SizedBox(
                      width: double.infinity,
                      height: 50,
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
                              const SnackBar(content: 
                              Text("Login Successful"),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1),() 
                             {
                              Navigator.pushReplacement(context,
                               MaterialPageRoute(builder: (context) => const MedicineListScreen(),
                               ),
                               );
                             });
                          }
                        },
                          
                          
                        
                        child: const Text(
                          "LOGIN"),
                        ),
                      ),
                      const SizedBox(height: 20),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? ",style: TextStyle(color: Colors.deepPurple),),
                          GestureDetector(
                            onTap: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                             );
                                
                              
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                
                              ),
                              
                            ),
                            
                            
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Column(
                        children: [
                          
                         const Text("Or",style: TextStyle(color: Colors.deepPurple),),

                        ],
                      ),
                      const SizedBox(height: 20),



                      /// SOCIAL ICONS
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          IconButton(
                            onPressed: () {
                          
                            print("Facebook clicked");
                          }, 
                          icon: Image.asset("assets/logo/facebook.png",
                          width: 35,
                          height: 35,
                          ),
                          
                          ),
                          SizedBox(width: 20),
                            
                            IconButton(
                              
                            onPressed: () {
                              print("Twitter clicked");
                            },
                            icon:Image.asset("assets/logo/twitter.png",
                            width: 35,
                            height: 35,
                            ),
                          ),
                     
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              print("Google clicked");
                            },
                            icon: Image.asset("assets/logo/google.png",
                            width: 30,
                            height: 35,
                            ),
                          ),
                        
                  ],
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
                