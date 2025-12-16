import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/app_text_field.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/presentation/screens/order_confirmation/order_confirmation.dart';
import 'package:technest/data/model/item.dart';

class CheckoutScreen extends StatefulWidget {
  final Item item;
  final String totalPrice;

  const CheckoutScreen({
    required this.item,
    required this.totalPrice,
    super.key,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Loading state
  bool isLoading = false;

  String selectedValue = "Cash on Delivery";
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Checkout screen appbar
      appBar: Appbar(text: 'Checkout'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shipping address
                AppText(
                  data: 'Shipping Address',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                const SizedBox(height: 16),

                // FullName address text field
                AppTextField(
                  controller: nameController,
                  label: "Name",
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(height: 16),

                // Email address text field
                AppTextField(
                  controller: addressController,
                  label: "Address",
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(height: 16),

                // Email address text field
                AppTextField(
                  controller: phoneController,
                  label: "Phone",
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),

                // Payment method
                AppText(
                  data: 'Payment Method',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                const SizedBox(height: 16),

                ChoiceChip(
                  label: AppText(data: 'Cash on Delivery'),
                  selected: selected == 1,
                  onSelected: (_) {
                    setState(() {
                      selected = 1;
                    });
                  },
                ),

                const SizedBox(height: 8,),

                ChoiceChip(
                  label: AppText(data: 'Credit Card (Updated Soon)'),
                  selected: selected == 2,
                  onSelected: (_) {
                    setState(() {
                      selected = 2;
                    });
                  },
                ),

                const SizedBox(height: 16),

                // Confirm order outlined button
                AppOutlinedButton(
                  onClick: () {
                    if (selected == 2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: AppText(
                            data: 'Credit Card option will be available soon.',
                          ),
                        ),
                      );
                      return;
                    }
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
                          builder: (context) => OrderConfirmation(
                            item: widget.item,
                            totalPrice: widget.totalPrice,
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
                      : AppText(
                          data: "Confirm Order",
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
