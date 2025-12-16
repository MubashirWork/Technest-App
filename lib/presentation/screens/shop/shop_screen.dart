import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_card.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/app_text_field.dart';
import 'package:technest/core/widgets/appbar.dart';
import 'package:technest/data/items/item_list.dart';
import 'package:technest/presentation/screens/detail/detail_screen.dart';

class ShopScreen extends StatefulWidget {

  final String? selectedCategory;

  const ShopScreen({super.key, this.selectedCategory});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  // Search controller
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final itemsToShow = widget.selectedCategory == null
        ? itemList
        : itemList
              .where(
                (item) =>
                    item.category.toLowerCase() ==
                    widget.selectedCategory!.toLowerCase(),
              )
              .toList();

    return Scaffold(
      // ShopScreen appbar
      appBar: Appbar(text: 'Shop'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search field
                AppTextField(
                  controller: searchController,
                  label: 'Search Product',
                  suffixIcon: Icons.search,
                  radius: 50,
                ),

                const SizedBox(height: 16),

                // All Products
                AppText(
                  data: widget.selectedCategory == null
                      ? "All Category Product"
                      : widget.selectedCategory!,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                const SizedBox(height: 8),

                SizedBox(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itemsToShow.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 0.80,
                    ),
                    itemBuilder: (context, index) {
                      final item = itemsToShow[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(item: item),
                            ),
                          );
                        },
                        child: AppCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Image(
                                image: item.image,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),

                              const SizedBox(height: 8),

                              AppText(
                                data: item.title,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                align: TextAlign.center,
                              ),

                              const SizedBox(height: 4),

                              AppText(
                                data: "${item.price.toStringAsFixed(2)} PKR",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                align: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
