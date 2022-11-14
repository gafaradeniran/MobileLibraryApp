import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaystackPayment {
  PaystackPayment(this.context, this.amount, this.email, this.name);

  BuildContext context;
  int amount;
  String email;
  String name;
  PaystackPlugin paystack = PaystackPlugin();

  //reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //paystack UI
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(
        publicKey: "pk_test_2756658ab37f81510493f0157583b93d2e64986f");
  }

  //method charging card
  chargeAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = amount * 100
        ..email = email
        ..reference = _getReference()
        ..currency = "NGN"
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: const Image(
          image: AssetImage("assets/bg/applogo.png"),
          height: 20,
          width: 20,
        ),
      );
      // final reference = response.reference;
      // Transaction transaction;

      if (response.status == true) {
        Fluttertoast.showToast(msg: 'Transaction successful');
      } else {
        Fluttertoast.showToast(msg: 'Transaction failed');
      }
    });
  }
}
