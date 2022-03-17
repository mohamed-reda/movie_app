import 'package:flutter/material.dart';

class ValidateToken extends StatefulWidget {
  const ValidateToken({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State createState() => _ValidateTokenState();
}

class _ValidateTokenState extends State<ValidateToken> {
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  bool _submitted = false;
  bool _submitted2 = false;
  String _name = '';
  String _password = '';

  void _submit() {
    if (_submitted2 && _submitted) {}
    setState(() {
      _submitted = true;
      _submitted2 = true;
    });
    if (_formKey.currentState!.validate()) {
      // get the Data
      // onSubmit(_name,_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Token: ${widget.token}"),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your name',
                    ),
                    autovalidateMode: _submitted
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    // The validator receives the text that the user has entered.
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if (text.length < 4) {
                        return 'Too short';
                      }
                      return null;
                    },
                    onChanged: (text) => setState(() => _name = text),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your Password',
                    ),
                    autovalidateMode: _submitted2
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    // The validator receives the text that the user has entered.
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if (text.length < 4) {
                        return 'Too short';
                      }
                      return null;
                    },
                    onChanged: (text) => setState(() => _password = text),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _name.isNotEmpty && _password.isNotEmpty
                        ? _submit
                        : null,
                    child: Text(
                      'Validate Request Token',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// {
// "username": "mohamed.reda.vod",
// "password": "mohamed.reda.vod@gmail.com",
// "request_token": "ade3a69477c378488088571c62d312c0e658feec"
// }
