import 'package:ECommerceApp/Common_utils/Consts/colors.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/alertDialog.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/Services/Database.dart';
import 'package:ECommerceApp/screens/auth/Signup.dart';
import 'package:ECommerceApp/screens/auth/login.dart';
import 'package:ECommerceApp/screens/bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static final routeName = "LandingPage";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  List<String> images = [
    'https://thumbs.dreamstime.com/b/woman-wearing-medical-mask-holding-credit-card-shopping-mall-prevention-coronavirus-covid-pandemic-new-young-185983506.jpg',
    'https://image.freepik.com/free-photo/confident-trendy-woman-safety-medical-mask-with-shopping-bag-smart-phone-is-walking-mall_283617-1385.jpg',
    'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F6058a92bc29892b5278f5886%2FTwo-young-girl-friends-in-safety-medical-masks-during-shopping-in-the-mall%2F960x0.jpg%3Ffit%3Dscale',
    'https://insideretail.asia/wp-content/uploads/2020/09/Shopper-in-mall.jpg',
    'https://m.foolcdn.com/media/millionacres/original_images/family_mall_shopping.jpg?crop=4:3,smart',
  ];
  AnimationController _animationController;
  Animation<double> _animation;
  AlertDialogCustom _alertbox = AlertDialogCustom();
  final AuthController _authController = AuthController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    images.shuffle();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationstatus) {
            if (animationstatus == AnimationStatus.completed) {
              _animationController.reset();

              _animationController.forward();
              images.shuffle();
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CachedNetworkImage(
          imageUrl: images[1],
          placeholder: (context, url) => Image.network(
            url,
            fit: BoxFit.contain,
          ),
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: double.infinity,
          width: double.infinity,
          alignment: FractionalOffset(_animation.value, 0),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Welcome To The Biggest online Store",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple)),
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
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink)),
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
                            Icons.person_add_alt,
                            color: Colors.white,
                            size: 18,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _isLoading
                    ? CircularProgressIndicator()
                    : OutlinedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          String res = await _authController.googleSignIn();
                          if (res != 'true') {
                            _alertbox.showDialogg(
                                "Error Occured", res, context);
                            print(_authController.getUser());
                          } else {
                            final user = _authController.getUser();
                            await DataBaseServices().userRegistration(
                                user.uid,
                                user.displayName,
                                user.photoURL,
                                user.phoneNumber,
                                user.email);
                          }
                        },
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
                              .copyWith(color: Colors.white),
                        )),
                //TODO impliment Facebook if possible priority :-minimum
                // OutlinedButton(
                //     onPressed: () {
                //       Navigator.of(context)
                //           .pushNamed(BottomBarScreen.screenname);
                //     },
                //     style: OutlinedButton.styleFrom(
                //       shape: StadiumBorder(),
                //       side: BorderSide(
                //         width: 2,
                //         color: Colors.deepPurple.shade200,
                //       ),
                //     ),
                //     child: Text(
                //       "Sign in as a Guest",
                //       style: Theme.of(context)
                //           .textTheme
                //           .headline5
                //           .copyWith(color: Colors.white),
                //     )),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        )
      ]),
    );
  }
}
