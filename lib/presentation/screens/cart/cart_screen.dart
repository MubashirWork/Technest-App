import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_container.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/presentation/screens/checkout/checkout_screen.dart';
import 'package:technest/data/model/item.dart';

class CartScreen extends StatefulWidget {
  final Item item;
  final int quantity;

  const CartScreen({required this.item, required this.quantity, super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Loading state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cart screen appbar
      appBar: Appbar(text: 'Cart'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Item detail
                AppContainer(
                  padding: 8,
                  borderColor: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: widget.item.image,
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: AppText(
                          data: widget.item.title,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          align: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 8),

                      AppText(
                        data: "${widget.item.price.toStringAsFixed(2)} PKR",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Item quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: "Item Quantity",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      data: "${widget.quantity}",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Delivery charges
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: 'Delivery Charges ',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      data: '200.00 PKR',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Total price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      data: 'Total Price',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      data:
                          "${(widget.item.price * widget.quantity + 200).toStringAsFixed(2)} PKR",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Check out outlined button
                AppOutlinedButton(
                  onClick: () {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            item: widget.item,
                            totalPrice:
                                "${(widget.item.price * widget.quantity + 200).toStringAsFixed(2)} PKR",
                          ),
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
                      : AppText(data: "Checkout", fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
