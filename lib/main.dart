import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buildEmail(),
          const SizedBox(
            height: 24,
          ),
          buildPassword(),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Email: ${emailController.text}');
                print('Password: ${senhaController.text}');
              }
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar o e-mail';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'E-mail',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.email),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              emailController.clear();
            },
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextFormField(
        controller: senhaController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar a senha';
          }
          if(value.length < 6) {
            return 'A senha deve ter no mínimo 6 caracteres';
          }
          return null;
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      );
}