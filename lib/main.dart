import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue), //
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = '';
  var bgColor = Colors.lightGreen.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI')),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),),
                SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your weight in (kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in (fit)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),

                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in (inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if (wt!="" && ft!='' && inch!='') {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if (bmi > 25) {
                        msg = "You are overweight!!";
                        bgColor = Colors.orangeAccent.shade200;
                    } else if (bmi <18) {
                      msg = "You are underweight!! ";
                      bgColor = Colors.red.shade200;
                    } else {
                      msg = "you are healthy";
                      bgColor = Colors.green.shade300;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                    });



                  } else {
                    setState(() {
                      result = 'please fill the all require fill';
                    });
                  }
                }, child: Text('Calculate', style: TextStyle(fontSize: 22),)),
                SizedBox(height: 12,),

                Text(result, style: TextStyle(fontSize: 19, color: Colors.red),)
              ],
            ),
          ),
        ),
      )
    );
  }
}