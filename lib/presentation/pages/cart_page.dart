import 'package:fflow_test_app/data/models/product.dart';
import 'package:fflow_test_app/presentation/widgets/app_image.dart';
import 'package:flutter/material.dart';

import 'package:fflow_test_app/presentation/utils/color_constants.dart';
import 'package:fflow_test_app/presentation/widgets/app_icon_button.dart';
import 'package:fflow_test_app/presentation/widgets/app_text_button.dart';

class CartPage extends StatefulWidget {
  final List<Product> products;

  const CartPage({Key? key, required this.products}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppIconButton(
                        onTap: () => Navigator.of(context).pop(),
                        borderRound: 10,
                        buttonSize: 42,
                        backgroundColor: AppColors.iconBackgroundPrimary,
                        icon: Icons.arrow_back_rounded,
                        iconColor: AppColors.primaryHighlight,
                        iconSize: 25,
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 42, 0),
                          child: Text(
                            'Корзина',
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
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.products.length,
                    itemBuilder: (_, index) => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 16, 0),
                                child: AppImage(
                                  url: widget
                                          .products[index].photoUrls?.first ??
                                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fthenounproject.com%2Fbrowse%2Ficons%2Fterm%2Funknown%2F&psig=AOvVaw0yjBwFcFbxVTJs3e8Cj8kv&ust=1680042653527000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMipyN6U_f0CFQAAAAAdAAAAABAF',
                                  borderRound: 10,
                                  isFullRounded: true,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    widget.products[index].name,
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Icon(
                                        Icons.grass,
                                        color: Color(0xFF938C8C),
                                        size: 24,
                                      ),
                                    ),
                                    Text(
                                      widget.products[index].productType.name,
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
                                SizedBox(height: 4),
                                Text(
                                  '${widget.products[index].packs.first}${Product.packTypTextResolver(widget.products[index].packType)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontFamily: 'Manrope',
                                        color: const Color(0xFF797474),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 4),
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
                                      '${widget.products[index].price}.',
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
                                  ],
                                ),
                              ],
                            ),
                            AppIconButton(
                              onTap: () {},
                              borderRound: 30,
                              buttonSize: 30,
                              icon: Icons.delete,
                              backgroundColor: Colors.transparent,
                              iconSize: 30,
                              iconColor: AppColors.iconPrimary,
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'СУММА',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            '349.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            '99',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'СТОИМОСТЬ ДОСТАВКИ:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        'БЕСПЛАТНО',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ВСЕГО:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            '349.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            '99',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: AppTextButton(
                    onTap: () {},
                    name: 'Оформить заказ',
                    height: 48,
                    borderRound: 15,
                    backgroundColor: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
