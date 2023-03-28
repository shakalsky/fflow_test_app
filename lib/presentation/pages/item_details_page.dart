import 'package:fflow_test_app/data/shared/shared_cart_cubit.dart';
import 'package:fflow_test_app/dependency_injector.dart';
import 'package:fflow_test_app/presentation/pages/cart_page.dart';
import 'package:fflow_test_app/presentation/widgets/app_image.dart';
import 'package:flutter/material.dart';

import 'package:fflow_test_app/presentation/utils/color_constants.dart';
import 'package:fflow_test_app/presentation/widgets/app_icon_button.dart';
import 'package:fflow_test_app/presentation/widgets/app_text_button.dart';
import 'package:fflow_test_app/data/models/product.dart';

class ItemDetailsPageWidget extends StatefulWidget {
  final Product product;

  const ItemDetailsPageWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ItemDetailsPageWidget> createState() => _ItemDetailsPageWidgetState();
}

class _ItemDetailsPageWidgetState extends State<ItemDetailsPageWidget> {
  int selectedPack = 0;
  int productsCount = 1;
  String? selectedPhotoUrl;
  late final SelectedProductsSharedCubit selectedProductsSharedCubit;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    selectedProductsSharedCubit = i.get<SelectedProductsSharedCubit>();

    selectedPhotoUrl = widget.product.photoUrls?.first;
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  void selectMainPhoto(String? url) {
    setState(() {
      selectedPhotoUrl = url;
    });
  }

  void selectPack(int index) {
    setState(() {
      selectedPack = index;
    });
  }

  void clearProductsCount() {
    setState(() {
      productsCount = 1;
    });
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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 8),
                    child: SizedBox(
                      height: 42.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppIconButton(
                            onTap: () => Navigator.pop(context),
                            borderRound: 10,
                            buttonSize: 42,
                            backgroundColor: const Color(0xFF343235),
                            icon: Icons.arrow_back_rounded,
                            iconColor: Colors.white,
                            iconSize: 25,
                          ),
                          AppIconButton(
                            onTap: () {
                              final products =
                                  selectedProductsSharedCubit.state.products;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(
                                    products: products,
                                  ),
                                ),
                              );
                            },
                            borderRound: 10,
                            buttonSize: 42,
                            backgroundColor: const Color(0xFF343235),
                            icon: Icons.shopping_cart_outlined,
                            iconColor: Colors.white,
                            iconSize: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9E9E0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 16, 20),
                                  child: ListView.builder(
                                    itemCount:
                                        widget.product.photoUrls?.length ?? 0,
                                    itemBuilder: (_, index) => GestureDetector(
                                      onTap: () => selectMainPhoto(
                                        widget.product.photoUrls![index],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: AppImage(
                                            url: widget
                                                .product.photoUrls![index],
                                            isFullRounded: true,
                                            borderRound: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryBackground,
                                  ),
                                  child: AppImage(
                                    url: selectedPhotoUrl,
                                    borderRound: 20,
                                    isFullRounded: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9E9E0),
                          ),
                          child: Text(
                            widget.product.name,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Icon(
                                Icons.grass,
                                color: Color(0xFF938C8C),
                                size: 24,
                              ),
                            ),
                            Text(
                              widget.product.productType.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontFamily: 'Manrope',
                                    color: const Color(0xFF797474),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5 * 2,
                              child: Text(
                                'Выбрать фасовку:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.0,
                                child: ListView.builder(
                                  itemCount: widget.product.packs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => selectPack(index),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8, 0, 8, 0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: selectedPack == index
                                              ? AppColors.iconBackgroundPrimary
                                              : AppColors.buttonSecondary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 0, 16, 0),
                                          child: Text(
                                            '${widget.product.packs[index]}${Product.packTypTextResolver(widget.product.packType)}',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: selectedPack == index
                                                        ? AppColors
                                                            .primaryHighlight
                                                        : AppColors
                                                            .primaryText),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Theme.of(context).primaryColor,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                indicatorColor: AppColors.primary,
                                tabs: const [
                                  Tab(
                                    text: 'Описание',
                                  ),
                                  Tab(
                                    text: 'Состав',
                                  ),
                                ],
                              ),
                              Container(
                                height: 80.0,
                                padding: const EdgeInsets.only(top: 16.0),
                                child: TabBarView(
                                  children: [
                                    ListView.builder(
                                      itemCount:
                                          widget.product.description?.length ??
                                              0,
                                      itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
                                        child: Text(
                                          '• ${widget.product.description![index]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    ),
                                    Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontFamily: 'Manrope',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '${widget.product.price * int.parse(widget.product.packs[selectedPack])}.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontFamily: 'Manrope',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '99',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontFamily: 'Manrope',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '  x$productsCount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontFamily: 'Manrope',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 16, 0),
                              child: AppTextButton(
                                onTap: () {
                                  Widget cancelButton = TextButton(
                                      child: const Text("Cancel"),
                                      onPressed: () {
                                        productsCount = 1;
                                        Navigator.of(context).pop();
                                      });
                                  Widget continueButton = TextButton(
                                    child: const Text("Add"),
                                    onPressed: () {
                                      for (int i = 0; i < productsCount; i++) {
                                        selectedProductsSharedCubit
                                            .addProduct(widget.product);
                                      }
                                      final products =
                                          selectedProductsSharedCubit
                                              .state.products;
                                      clearProductsCount();
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CartPage(
                                            products: products,
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  AlertDialog alert = AlertDialog(
                                    title: const Text("Order"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Order $productsCount product(s)'),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppIconButton(
                                              onTap: () {
                                                if (productsCount == 1) {
                                                  Navigator.of(context).pop();
                                                  productsCount = 1;
                                                } else {
                                                  setState(() {
                                                    productsCount--;
                                                  });
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              borderRound: 10,
                                              buttonSize: 42,
                                              backgroundColor:
                                                  const Color(0xFF343235),
                                              icon: Icons.remove,
                                              iconColor: Colors.white,
                                              iconSize: 25,
                                            ),
                                            const SizedBox(width: 16.0),
                                            AppIconButton(
                                              onTap: () {
                                                setState(() {
                                                  productsCount++;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              borderRound: 10,
                                              buttonSize: 42,
                                              backgroundColor:
                                                  const Color(0xFF343235),
                                              icon: Icons.add,
                                              iconColor: Colors.white,
                                              iconSize: 25,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                },
                                name: 'Оформить заказ',
                                width: 200,
                                height: 48,
                                backgroundColor: const Color(0xFF427A5B),
                                borderRound: 15,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 32),
                        child: AppTextButton(
                          onTap: () {},
                          name: 'Заказ',
                          height: 48,
                          backgroundColor: AppColors.buttonSecondary,
                          borderRound: 15,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
