import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_card.dart';
import 'package:technest/core/widgets/app_text.dart';
import 'package:technest/core/widgets/app_text_field.dart';
import 'package:technest/presentation/screens/detail/detail_screen.dart';
import 'package:technest/presentation/screens/home/data/sale_list.dart';
import 'package:technest/presentation/screens/shop/shop_screen.dart';
import 'data/category_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Search controller
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HomeScreen appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppText(data: 'Home', fontSize: 20, fontWeight: FontWeight.w600),
      ),
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

                // All Categories
                AppText(
                  data: 'All Categories',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = categoryList[index];
                      return Column(
                        children: [
                          GestureDetector(
                            child: AppCard(
                              child: Image(
                                image: item.image,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.25,
                                fit: BoxFit.contain,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShopScreen(selectedCategory: item.title),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 8),

                          AppText(
                            data: item.title,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      );
                    },
                    itemCount: categoryList.length,
                  ),
                ),

                const SizedBox(height: 16),

                // Sale Products
                AppText(
                  data: 'Flash Sale 30% Off',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                const SizedBox(height: 8),

                SizedBox(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: saleList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 0.89,
                    ),
                    itemBuilder: (context, index) {
                      final item = saleList[index];
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
