import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 350),
                Container(
                  width: 50,
                  color: Colors.red,
                  height: 50,
                ),
                TextButton(
                  onPressed: _onPressed,
                  child: const Text('Press me'),
                ),
                _TestFormField(
                    focusNode: _focusNode1, type: TextInputType.emailAddress),
                _TestFormField(
                    focusNode: _focusNode2, type: TextInputType.phone),
                const SizedBox(
                  height: 51.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    await Clipboard.setData(const ClipboardData(text: ''));
    _focusNode2.requestFocus();
    await Future.delayed(const Duration(milliseconds: 1000));
    _focusNode1.requestFocus();
    await Future.delayed(const Duration(milliseconds: 1000));
    _focusNode2.requestFocus();
    await Future.delayed(const Duration(milliseconds: 1000));
    _focusNode2.requestFocus();
  }
}

class _TestFormField extends StatelessWidget {
  const _TestFormField({this.type, this.focusNode});

  final TextInputType? type;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      initialValue: '123456789',
      keyboardType: type,
    );
  }
}
