import 'package:flutter/material.dart';
import 'login.dart';

class   DetailsScreen extends StatefulWidget {
 const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState()=> _DetailsScreen(); 
}
class _DetailsScreen extends State<DetailsScreen> {


    final PageController _controller = PageController();
    int currentIndex = 0;
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);
        },

      ),
     ),
      
      body: SafeArea(
        
        child: Column(
          children: [
            Expanded(
              child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
                
              },
              children: [
                buildPage(
                  image:'assets/logo/med4.png',
                  title:"All your medicines",
                  subtitle:
                  "Get all your prescribed and daily essentials in one place, you just place the order we do the rest",
                ),
                
                buildPage(
                  image: 'assets/logo/med3.png',
                  title: "Fast Delivery",
                  
                  subtitle: 
                  "Quick and safe medicine delivery at your doorstep",
                ),
                buildPage( 
                  image: 'assets/logo/med5.png',
                 title: "Give Offers",
                 subtitle: 
                 "Get offer by eligible medicines",
                 ),
              ],
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(0),
                buildDot(1),
                buildDot(2),
              ],
            ),
            const SizedBox(height: 30),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
            child: currentIndex == 2
            ? SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton( 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            onPressed: () {
              Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => LoginScreen()),
               );
            },
            
              child: const Text(
                "GET STARTED",
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
                ),
              ),
              ),
            ):
               
                 
                    Column (
                children: [
                   SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        _controller.nextPage (
                          duration: Duration(milliseconds: 300),
                           curve: Curves.ease,
                           );
                      },
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        _controller.jumpToPage(2);
                      },
                      child: const Text(
                        "SKIP",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
               ),
            ),
          
         
        
          
          const SizedBox(height: 20),
              
        
          ],
        ),
      ),
      );
    
  }
  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Padding(padding: 
    const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(tag: "mainLogo", child: 
        Image.asset(
          image,
          height: 250,
          fit: BoxFit.contain,
        ),
        ),
        const SizedBox(height: 40),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
    );
  }
  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
       margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentIndex == index ? 20 :8,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Colors.orange
            : Colors.orange.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
       
}