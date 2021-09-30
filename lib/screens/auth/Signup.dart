import 'dart:io';

import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/alertDialog.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/Services/Database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SignUpPage extends StatefulWidget {
  static final routeName = "SignUpPage";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  String _emailAddress = '';
  String _password = '';
  String number;
  String name;
  bool issecure = true;
  bool _isLoading = false;
  File _pickImage;
  AlertDialogCustom _alertbox = AlertDialogCustom();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  void submitForm() async {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      final AuthController _authController = AuthController();
      if (_pickImage == null) {
        _alertbox.showDialogg("Image", "Please Pick an Image", context);
        setState(() {
          _isLoading = false;
        });
      } else {
        final DataBaseServices _db = DataBaseServices();
        final imgurl = await _db.setphotoUrl(name, _pickImage);
        String result =
            await _authController.userRegisteration(_emailAddress, _password);
        if (result == 'true') {
          if (await _db.userRegistration(_authController.getUser().uid, name,
              imgurl, number, _emailAddress)) {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          } else {
            _alertbox.showDialogg(
                "Error Occured", "Some unknown Error Occured", context);
            setState(() {
              _isLoading = false;
            });
          }
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
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _pickImage = null;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
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
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor:
                            dynamicTheme.dynamiccolorObj().gradientLstart,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor:
                              dynamicTheme.dynamiccolorObj().gradientLEnd,
                          backgroundImage:
                              _pickImage == null ? null : FileImage(_pickImage),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 120,
                      child: RawMaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Choose an Option",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: dynamicTheme
                                            .dynamiccolorObj()
                                            .gradientLstart),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Dialog_Row(
                                          press: _pickImageCamera,
                                          icon: Icons.camera,
                                          text: "Camera",
                                        ),
                                        Dialog_Row(
                                          press: _pickImageGallery,
                                          icon: Icons.image,
                                          text: "Gallery",
                                        ),
                                        Dialog_Row(
                                          press: _remove,
                                          icon: Icons.remove_circle,
                                          text: "remove",
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        elevation: 10,
                        fillColor: dynamicTheme.dynamiccolorObj().gradientLEnd,
                        child: Icon(Icons.add_a_photo),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          key: ValueKey('name'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the valid name";
                            }
                            return null;
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name Goes Here',
                            fillColor: Theme.of(context).primaryColorLight,
                          ),
                          onSaved: (value) {
                            name = value;
                          },
                        ),
                      ),
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
                          focusNode: _emailFocusNode,
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
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_phoneFocusNode),
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
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          key: ValueKey('Phone'),
                          validator: (value) {
                            if (value.isEmpty || value.length != 10) {
                              return "Please enter valid Phone Number";
                            }
                            return null;
                          },
                          focusNode: _phoneFocusNode,
                          onEditingComplete: submitForm,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Icons.phone_android),
                            labelText: 'Contact Number Goes Here',
                            fillColor: Theme.of(context).primaryColorLight,
                          ),
                          onSaved: (value) {
                            number = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
                                      "SignUp",
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
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
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
                    Text(
                      "Or Continue  with",
                      style: Theme.of(context).textTheme.headline4,
                    ),
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
                //TODO !delete that Sizedbox
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

class Dialog_Row extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function press;

  const Dialog_Row({Key key, this.icon, this.text, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: Theme.of(context).hoverColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Theme.of(context).hoverColor),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    );
  }
}
