import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_container.dart';
import 'package:technest/core/widgets/app_loading_indicator.dart';
import 'package:technest/core/widgets/app_outlined_button.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/presentation/screens/cart/cart_screen.dart';
import 'package:technest/data/model/item.dart';

class ProductDetailScreen extends StatefulWidget {
  final Item item;

  const ProductDetailScreen({required this.item, super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Toggle loading state
  bool isLoading = false;

  // Quantity state
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(text: 'Product Detail'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item image
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: widget.item.image,
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 0.60,
                  ),
                ),

                // Item title
                AppText(
                  data: widget.item.title,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),

                const SizedBox(height: 8),

                // Item price
                AppText(data: "${widget.item.price.toStringAsFixed(2)} PKR"),

                const SizedBox(height: 16),

                AppText(
                  data: "Description",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.visible,
                ),

                const SizedBox(height: 8),

                // Description
                AppText(
                  data: widget.item.description,
                  fontSize: 15,
                  overflow: TextOverflow.visible,
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      data: "QTY: $value",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(width: 8),
                    AppContainer(
                      padding: 4,
                      containerColor: Colors.indigoAccent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            value++;
                          });
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppContainer(
                      padding: 4,
                      borderColor: Colors.indigoAccent,
                      containerColor: Colors.indigoAccent,
                      child: InkWell(
                        onTap: () {
                          if (value == 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: AppText(
                                  data: 'Minimum order quantity should be 1.',
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              value--;
                            });
                          }
                        },
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                  ],
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
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartScreen(item: widget.item, quantity: value),
                      ),
                    );
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
                          data: "Add to Cart",
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
