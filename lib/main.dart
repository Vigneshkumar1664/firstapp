import 'package:flutter/material.dart';
import 'details.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
     home: Homepage(),
      
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState()=>_Homepage();
}
    class _Homepage extends State<Homepage> {


    @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
      
        
        
      children: [
          Positioned.fill(child: 
        Image.asset('assets/logo/med1.jpg',
       fit: BoxFit.cover,
        ),
        ),
      
      
      
     
      
      Align(
        alignment: Alignment.center,
    
  
        child: 
      
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(5),
          minimumSize: Size(200, 200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        
        child: Hero(tag: "mainLogo", child:  Image.asset('assets/logo/med2.png',
        width: 200,
        height: 200,
        fit: BoxFit.fill,),
        ),
        onPressed: () {
          Navigator.push(
            context,MaterialPageRoute(builder: (context)=>
            DetailsScreen(),
            
            ),
          
          
          );
      
        },
      ),
      ),
      
      ],
      ),
      
      
      
    );
    
  }
  }
  


