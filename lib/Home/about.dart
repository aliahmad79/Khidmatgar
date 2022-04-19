import 'package:fiazproject/Home/drawer.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.indigo.shade500,
        actions: [IconButton(onPressed:
            (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage()));
        }, icon: Icon(Icons.home_outlined))],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12.0),
                 color: Colors.blue.withOpacity(0.4),
               ),
               margin: EdgeInsets.only(top: 20.0,bottom: 30.0),

               height: 200,
               width: double.infinity,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: [
                   Row(
                     children: [
                       Container(
                         child: Image.asset("images/logo.png", width: 155,),
                       ),

                       Container(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 15.0, right: 5.0, left: 20.0),
                           child: Column(
                             children: [
                               Text("Our Mission",style: TextStyle(color:Colors.black,fontSize:18, fontWeight: FontWeight.bold,),),
                               SizedBox(height: 10.0,),
                               Text(" Our mission is to add \n value in customer's \n life by providing "
                                   "them \n all services under one \n platform with safety, \n"
                                   " security and price ", textAlign: TextAlign.justify ,),

                             ],
                           ),
                         ),

                       ),
                     ],
                   ),

                 ],
               ),
             ),
              Text("Our Company", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10.0,),
              Text("Khidmatgar (apki dahleez par) is formed with the idea of giving all an improved and worriless lifestyle, "
                  "promoting trustworthiness and goodwill.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15.0,),
              Text("Our Vision", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10.0,),
              Text("Khidmatgar aspires to become an amazon of services and revolutionize the service providing industry of Pakistan. "
                  "Currently, we are facilitating about residential and commercial clients with many services,"
                  " and to further facilitate your lives, we will be soon expand our services. "
                  "Our vision is to establish an institute to provide skilled education and professional"
                  " careers to the skilled workers of Pakistan."
                  " Our aim is to bring economic stability to the country by eradicting unemployment and "
                  "providing an opportunity for all.",
                textAlign: TextAlign.justify,
                  ),
              SizedBox(height: 15.0,),
              Text("Our Passion", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10.0,),
              Text("We are passionate about our goals and are always willing to go to extra mile to give customers the experience they"
                  "yearn for and deserve!",
                textAlign: TextAlign.justify,)
            ],
          ),
        ),
      ),
    );
  }
}
