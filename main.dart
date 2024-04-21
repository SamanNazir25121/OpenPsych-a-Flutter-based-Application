import 'package:flutter/material.dart';
import 'second.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
     
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    navigateToSecondPage();
  }

  void navigateToSecondPage() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPEN PSYCH'),
    
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 14, 111, 190), Color.fromARGB(255, 136, 185, 138)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
         child: const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0), // Adjust the top padding as needed
             child: Image(image: AssetImage('images/openp.png'), // Replace with your image path
              width: 2000,
              height: 2000,
            ),
         
          ),
        ),
      ),


    );
  }
  

}




//----------------s
/*GestureDetector(
      onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AI_bot()),
    );
  },
  
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Adjust the border radius as desired
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10), // Same border radius as the container
      child: Image.asset(
        'images/bot.png', // Replace with your image path
        fit: BoxFit.cover,
        alignment: const Alignment(100,200),
      ),
    ),
  ),
),*/





      //--------------------- Exercise  buttons
      /* floatingActionButton: Align(
        alignment: const Alignment(-0.8,-0.7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, // Set the background color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExercisePage()),
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.fitness_center),
                SizedBox(width: 30,height: 100,),
                Text('Exercise' , ),
              ],
            ),
          ),
        ),
      ),*/
