import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Form Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const SigninPage(),
  ));
}

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => SigninState();
}

class SigninState extends State<SigninPage> {
  String id = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Demo'),
      ),
      body: Center(
        child: Form(
          // 값이 입력되는 동안에 해당 TextFieldForm의 validate() 호출
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: const [
                    Text('password',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                  ],
                ),
                TextFormField(onSaved: (String? val) {
                  setState(() {
                    id = val!;
                  });
                }, validator: (String? val) {
                  if ((val?.length ?? 0) < 1) return 'id는 1글자 이상 입력해야 합니다.';
                  return null;
                }),
                Container(height: 16),
                Row(
                  children: const [
                    Text('password',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                  ],
                ),
                TextFormField(onSaved: (String? val) {
                  setState(() {
                    password = val!;
                  });
                }, validator: (String? val) {
                  if ((val?.length ?? 0) < 8) {
                    return 'password는 8글자 이상 입력해야 합니다.';
                  }
                  return null;
                }),
                ElevatedButton(
                    onPressed: () {
                      // validate()는 formKey의 TextFormField의 validator를 하나씩 호출하여 검증.
                      // 하나라도 문자열 반환하는 값이 있으면 true 반환
                      if (formKey.currentState?.validate() != false) {
                        // formKey의 TextFormField의 onSaved를 하나씩 호출
                        formKey.currentState?.save();
                      }
                    },
                    child: const Text('submit')),
                Text('id: $id'),
                Text('password: $password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
