import 'package:flutter/material.dart';

class calculator extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget 
{
  Calculator({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<Calculator> 
{
  double input_pertama=0.0;
  double input_kedua=0.0;
  String object="";
  String hasil ="0";
  String _keluaran="0";
  buttonpressed(String buttontext) 
  {

    if(buttontext == "+")
    {
        input_pertama = double.parse((hasil));
        object = buttontext;
        _keluaran = "0";
    }

    else if(buttontext == "-")
    {
        input_pertama = double.parse((hasil));
        object = buttontext;
        _keluaran = "0";
    }

    else if(buttontext == "/")
    {
        input_pertama = double.parse((hasil));
        object = buttontext;
        _keluaran = "0";
    }

    else if(buttontext == "X")
    {
        input_pertama = double.parse((hasil));
        object = buttontext;
        _keluaran = "0";
    }

    else if (buttontext == "=")
    {
        input_kedua=double.parse(hasil);

        if(object=="X")
        {
          _keluaran=(input_pertama*input_kedua).toString();
        }

        else if(object=="/")
        {
          _keluaran=(input_pertama/input_kedua).toString();
        }

        else if(object=="+")
        {
          _keluaran=(input_pertama+input_kedua).toString();
        }

        else if(object=="-")
        {
          _keluaran=(input_pertama-input_kedua).toString();
        }

        input_pertama=0.0;
        input_kedua=0.0;
        hasil="";
    }

    else if (buttontext == ".")
        {
      if (_keluaran.contains(".")) 
      {
        print("Sudah Decimal ");
        return;
      }
      else 
      {
        _keluaran = _keluaran + buttontext;
      }
    }

    else if (buttontext == "C") {
      _keluaran = "0";
      input_pertama = 0.0;
      input_kedua = 0.0;
      object = "";
    }

    else
      {
        _keluaran=_keluaran + buttontext;
      }
    print(_keluaran);
    setState(() {
      hasil=double.parse(_keluaran).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttontext)
  {
    return Expanded(
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.black
            ),
        ),
        child: Text(
            buttontext,
            style: TextStyle(
            fontSize: 20.0,
            fontWeight:FontWeight.bold,
        ),
        ),
        padding: EdgeInsets.all(20.0),
        color: Colors.cyanAccent,
        textColor: Colors.black,
        onPressed: ()=>
          buttonpressed(buttontext)
        ,
      )
    );
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(

      appBar: AppBar(
                title: new Text("Calculator",style: new TextStyle(color: Colors.white,),),
                leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                    Navigator.pop(context);
                },
                ),
            ),
      body:Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0
              ),
                child: Text(hasil,
                style: TextStyle(
                  fontSize: 40.0,
                ),
                )
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children:[
                Row(
                  children:[
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("X")
                ]),
                Row(
                    children:[
                      buildbutton("4"),
                      buildbutton("5"),
                      buildbutton("6"),
                      buildbutton("/")
                    ]),
                Row(
                    children:[
                      buildbutton("1"),
                      buildbutton("2"),
                      buildbutton("3"),
                      buildbutton("+")
                    ]),
                Row(
                    children:[
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("C"),
                      buildbutton("-")
                    ]),
                Row(
                    children:[

                      
                      buildbutton("=")
                    ]),
              ]),

          ],
        ),

      )

    );
  }
}