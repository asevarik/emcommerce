import 'package:ECommerceApp/Common_utils/Widgets/CartscreenWidgets/CartFull.dart';
import 'package:ECommerceApp/Common_utils/Widgets/CartscreenWidgets/Cartempty.dart';
import 'package:ECommerceApp/Common_utils/Widgets/GlobalWidgets/alertDialog.dart';
import 'package:ECommerceApp/Common_utils/provider/cart_provider.dart';
import 'package:ECommerceApp/Models/user.dart';
import 'package:ECommerceApp/Services/AuthController.dart';
import 'package:ECommerceApp/Services/Database.dart';
import 'package:ECommerceApp/screens/intermediatepay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class CartPage extends StatefulWidget {
  static String RouteName = "Cartpage";

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(double amount, String email, String contact) async {
    var options = {
      'key': 'rzp_test_uSWlqbu20tT09v',
      'amount': amount.toString(),
      'name': 'Paying Ecommerce Merchant',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    //TODO :navigate to success page screen apart from bottombar
    Toast.show("success Wallet", context);
    Navigator.of(context).pushNamed(SuccessPayment.routeName);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    //TODO :navigate to Error Screen
    print("Error");
    AlertDialogCustom().showDialogg(
        "Error Occured", "The payment has been cancelled", context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    //TODO we have to explore this part
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: cartProvider.getCartItems.isEmpty
          ? null
          : buildAppBar(context, cartProvider),
      body: cartProvider.getCartItems.isEmpty ? CartEmpty() : CartFullBody(),
      bottomNavigationBar: cartProvider.getCartItems.isEmpty
          ? null
          : CartCheckout(
              press: () {
                openCheckout(
                    cartProvider.totalAmount, UserData.email, UserData.phone);
              },
            ),
    );
  }
}
