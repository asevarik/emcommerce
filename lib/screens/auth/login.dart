import 'package:ECommerceApp/Common_utils/Consts/Size_config.dart';
import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/alertDialog.dart';
import 'package:ECommerceApp/Models/user.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/screens/auth/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  static final routeName = "LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String _emailAddress = '';
  String _password = '';
  bool issecure = true;
  bool _isLoading = false;
  AlertDialogCustom _alertbox = AlertDialogCustom();

  final FocusNode _passFocusNode = FocusNode();
  void submitForm() async {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      print(_password);

      final AuthController _authController = AuthController();
      String result = await _authController.userLogin(_emailAddress, _password);
      if (result == 'true') {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
        setState(() {
          _isLoading = false;
        });
      } else {
        _alertbox.showDialogg("Error Occured", result, context);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DynamicColorChangerProvider dynamicTheme =
        DynamicColorChangerProvider(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                    gradients: [
                      [
                        dynamicTheme.dynamiccolorObj().gradientLstart,
                        dynamicTheme.dynamiccolorObj().gradientLEnd
                      ],
                      [
                        dynamicTheme.dynamiccolorObj().gradientLEnd,
                        dynamicTheme.dynamiccolorObj().gradientLstart
                      ],
                    ],
                    durations: [
                      19440,
                      10800
                    ],
                    heightPercentages: [
                      0.20,
                      0.25
                    ],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.bottomRight),
                waveAmplitude: 0,
                size: Size(double.infinity, double.infinity),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://thumbs.dreamstime.com/b/woman-wearing-medical-mask-holding-credit-card-shopping-mall-prevention-coronavirus-covid-pandemic-new-young-185983506.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return "Please enter the valid email address";
                            }
                            return null;
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email Address Goes Here',
                            fillColor: Theme.of(context).primaryColorLight,
                          ),
                          onSaved: (value) {
                            _emailAddress = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                            key: ValueKey('password'),
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Please enter the valid Password";
                              }
                              return null;
                            },
                            onEditingComplete: submitForm,
                            focusNode: _passFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    issecure = !issecure;
                                  });
                                },
                                child: Icon((issecure)
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Your Super Secret Password',
                              fillColor: Theme.of(context).primaryColorLight,
                            ),
                            onSaved: (value) {
                              _password = value;
                            },
                            obscureText: issecure),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 1.6,
                            bottom: 12),
                        child: InkWell(
                          child: Text("Forgot Password?"),
                          onTap: () => Navigator.pushNamed(
                              context, ForgotPage.routeName),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: submitForm,
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).hoverColor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: ColorsConsts.white,
                          thickness: 2,
                        ),
                      ),
                    ),
                    Text("Or Continue  with",
                        style: Theme.of(context).textTheme.headline4),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: ColorsConsts.white,
                          thickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                        child: Text(
                          "Google +",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.red),
                        )),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(
                            width: 2,
                            color: Colors.deepPurple.shade200,
                          ),
                        ),
                        child: Text(
                          "Facebook",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.purple),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
