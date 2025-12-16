import 'dart:math';

import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_card.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/navigation/bottom_navigation.dart';
import 'package:technest/data/model/item.dart';

class OrderConfirmation extends StatefulWidget {

  final Item item;
  final String totalPrice;
  const OrderConfirmation({required this.item, required this.totalPrice, super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  // Loading state
  bool isLoading = false;

  // Unique order number generation
  Random random = Random();
  late int orderNumber = random.nextInt(900000) + 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Order confirmation appbar
      appBar: Appbar(text: 'Order Confirmation'),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Item detail
                AppCard(
                  padding: 16,
                  child: Column(
                    children: [
                      Image(
                        image: widget.item.image,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 100,
                      ),

                      SizedBox(height: 8),

                      AppText(
                        data: widget.item.title,
                        align: TextAlign.center,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 8),

                      AppText(
                        data: widget.totalPrice,
                        overflow: TextOverflow.ellipsis,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                AppText(
                  data: 'Thank you for your order!',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  align: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                AppText(
                  data: 'Order Id: #$orderNumber',
                  align: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                AppText(
                  data: 'Estimated Delivery: Within five days',
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  align: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Add to card outlined button
                AppOutlinedButton(
                  onClick: () {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigation(),
                        ),
                      );
                    });
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              data: 'Loading...',
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 8),
                            AppLoadingIndicator(),
                          ],
                        )
                      : AppText(
                          data: "Continue Shopping",
                          fontWeight: FontWeight.w500,
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
