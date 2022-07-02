import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(new MyApp());
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',


      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already contains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        if (num2!=0){
        _output = (num1 / num2).toString();}
        else {
          _output = "Error";
        }
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {
      if (_output != "Error") {
        output = double.parse(_output).toStringAsFixed(2);
      }
      else{
        output = (_output);
      }
    });

  }

  Widget buildButton(String buttonText, [BorderRadius? borderRadius]) {
    return new Expanded(
      child: new GestureDetector(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: new CircleAvatar(
            radius: 40,
            child: Text(buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget buildButton1(String buttonText, [BorderRadius? borderRadius]) {
    return new Expanded(
      child: new GestureDetector(


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: new CircleAvatar(
            backgroundColor: Colors.deepPurple[300],
            radius: 40,
            child: Text(buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget buildButton2(String buttonText, [BorderRadius? borderRadius]) {
    return new Expanded(
      child: GestureDetector(


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: new CircleAvatar(
            backgroundColor: Colors.blue[800],
            radius: 40,
            child: Text(buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () =>
            buttonPressed(buttonText)
        ,
      ),
    );

  }


  Widget buildoval(String buttonText, [BorderRadius? borderRadius]){
    return new SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,0,0,0),
        child: SizedBox(

          width: 280,
          height: 70,
          child: new ElevatedButton(onPressed: () {
            buttonPressed(buttonText);
          },
            child: Text(buttonText,
                style: TextStyle(

                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                )
            ),
            style:ElevatedButton.styleFrom(

              shape : RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),

    );}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            color: Colors.blueGrey[900],
            child: new Column(
              children: <Widget>[
                new Container(

                    color: Colors.blueGrey[300],
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
                // new Container(
                //   // color: Colors.blueGrey[300],
                //   // child: Row(
                //   //   mainAxisAlignment: MainAxisAlignment.end,
                //   //   children: <Widget>[Text(" Reitika Kumar - 102116008 \n Rohit Rana - 102116012\n Sarvika Bhan - 102116038\n Gyan Singh Budhiraja - 102116041\n Kingshuk Mukherjee - 102116054\n Tanya Chopra - 102116069",)],
                //   // ),
                //
                // ),
                new Container(

                  color: Colors.blueGrey[300],
                  height: 150,
                  child: new Divider(


                    color: Colors.blueGrey[300],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: new Column(children: [
                    new Row(children: [

                      buildButton("7",),
                      buildButton("8",),
                      buildButton("9"),
                      buildButton1("/")
                    ]),
                    Container(
                      height: 5,
                    ),

                    new Row(children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton1("X")
                    ]),
                    Container(
                      height: 5,
                    ),

                    new Row(children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton1("-")
                    ]),
                    Container(
                      height: 5,
                    ),

                    new Row(children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton1("+")
                    ]),
                    Container(
                      height: 5,
                    ),

                    new Row(children: [

                      buildoval("CLEAR"),
                      buildButton2("="),

                    ]),
                    Container(
                      height: 5,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                  child: new Marquee(
                    text: 'Reitika Kumar - 102116008      Rohit Rana - 102116012      Sarvika Bhan - 102116038      Gyan Singh Budhiraja - 102116041      Kingshuk Mukherjee - 102116054      Tanya Chopra - 102116069      ',

                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[200]),
                    scrollAxis: Axis.horizontal,



                    velocity: 70.0,




                  ),
                )

              ],
            )));
  }
}