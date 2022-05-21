import 'package:flutter/material.dart';
import '/Provider/home_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Form(
            key: provider.loginForm,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: TextFormField(
                        controller: provider.userName,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          hintText: ' User Name',
                          // Here is key idea
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter User Name';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: TextFormField(
                        controller: provider.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          hintText: 'Password',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      )),
                  Row(
                    children: [
                     Expanded(
                       flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: MaterialButton(
                              color: Colors.white,
                              onPressed:()=>provider.clearData(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.green)),
                              child: const Text(
                                'Clear',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: MaterialButton(
                              color: Colors.green,
                              onPressed: ()=> provider.logIn(context),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(color: Colors.green)),
                              child:const  Text(
                                'Submit',
                                style:  TextStyle(color: Colors.white),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ]),
          );
        },
      ),
    );
  }
}
