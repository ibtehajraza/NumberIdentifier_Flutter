import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: NumberIdentifier(),
    );
  }
}

class NumberIdentifierState extends State<NumberIdentifier> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "This is title",
        ),
      ),
//      primary: true,
      body: _getForm(),
    );
  }

  Widget _getBody() {
    return Container(
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: "This is a hint text",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _getForm() {
    return Container(
      child: Center(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter you're mobile number";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));

                    }
                  },
                  child: Text("Check"),
                ),
              ),
            ],
          ),
          key: _formKey,
        ),
      ),
    );
  }
}

class NumberIdentifier extends StatefulWidget {
  @override
  NumberIdentifierState createState() {
    return NumberIdentifierState();
  }
}
