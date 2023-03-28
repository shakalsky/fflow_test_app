import 'package:fflow_test_app/data/product_repository.dart';
import 'package:fflow_test_app/dependency_injector.dart';
import 'package:fflow_test_app/presentation/widgets/app_image.dart';
import 'package:flutter/material.dart';

import 'package:fflow_test_app/data/models/product.dart';
import 'package:fflow_test_app/presentation/pages/item_details_page.dart';
import 'package:fflow_test_app/presentation/widgets/app_icon_button.dart';
import 'package:fflow_test_app/presentation/widgets/app_text_button.dart';
import 'package:fflow_test_app/presentation/utils/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late List<Product> products = [];

  @override
  void initState() {
    final repo = i.get<ProductRepository>();
    setState(() {
      repo.getProducts().then((value) => products = value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                          child: Text(
                            'Каталог товаров',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                      AppIconButton(
                        onTap: () {},
                        borderRound: 10,
                        buttonSize: 42,
                        iconSize: 25,
                        iconColor: AppColors.iconBackgroundPrimary,
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Text(
                          'Всего:',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontFamily: 'Manrope',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Text(
                        products.length.toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: products.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.64,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryHighlight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          16,
                          16,
                          16,
                          16,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: AppImage(
                                url: products[index].photoUrls?.first ??
                                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%2Fimages%3Fk%3Dno%2Bimage%2Bavailable&psig=AOvVaw2aemlY9P34PAMVJFP9CcL_&ust=1680048956115000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCICswJus_f0CFQAAAAAdAAAAABAE',
                                borderRound: 0,
                                isFullRounded: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 0),
                              child: Text(
                                products[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Icon(
                                      Icons.grass,
                                      color: Color(0xFF938C8C),
                                      size: 15,
                                    ),
                                  ),
                                  Text(
                                    products[index].productType.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFF797474),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            AppTextButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemDetailsPageWidget(
                                      product: products[index],
                                    ),
                                  ),
                                );
                              },
                              name: 'Подробнее',
                              height: 24,
                              backgroundColor: AppColors.primary,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              borderRound: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
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
