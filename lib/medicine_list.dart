import 'package:flutter/material.dart';

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});
  void showZoomImage(BuildContext context, String imagePath)
{
  showDialog(context: context, builder: (context)
  {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: InteractiveViewer(child: 
        Image.asset(imagePath),
        ),
      ),
    );
  },
  );
}
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: Text(
          "Medicine List"
        ),
        
        
        
        
      
      ),
       drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(accountName:Text("vignesh") ,
               accountEmail: Text("vicky16@gmail.com"),
               currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person,size: 40),
               ),
               
               ),
               ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  
                
                Navigator.pop(context);
                },
               ),
               ListTile(
                leading: Icon(Icons.shopping_cart_checkout_sharp),
                title: Text("Cart Checkout"),
                onTap: () {
                  Navigator.pop(context);
                },

               ),
               ListTile(
                leading: Icon(Icons.delivery_dining),
                title: Text("Delivery details"),
                onTap: () {
                  Navigator.pop(context);
                },
               ),
               
               


            ],
            
          ),
          
        ),
        
      
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          InkWell(
            onTap: () => showZoomImage(context,"assets/logo/dolo.jpg"),
          child: 
    Card( 
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Image.asset("assets/logo/dolo.jpg"),
              title: Text("Dolo 650"),
              subtitle: Text(" Fever & Pain Relief"),
              trailing: Text("₹30"),
            ),
    ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => showZoomImage(context,"assets/logo/Montek LC.jpg"),
            child: 
          
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),

            ),
            child: ListTile(
              leading: Image.asset("assets/logo/Montek LC.jpg"),
              title: Text("Montek LC"),
              subtitle: Text("allergic symptoms such as runny nose, stuffy nose, sneezing, itching, swelling, watery eyes, and congestion or stuffiness"),
              trailing: Text("₹200"),
            ),
          ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => showZoomImage(context, "assets/logo/telma AZ.jpg"),
            child: 
          
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Image.asset("assets/logo/telma AZ.jpg"),
              title: Text("Telma AZ"),
              subtitle: Text("controls blood pressure in patients with hypertension."),
              trailing: Text("₹176"),
            ),
          ),
          ),
        ],
      ),
    );
  }
}