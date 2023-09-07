import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/home/models/restaurant_model.dart';
import 'package:foodninja/app/modules/home/widgets/home_button_filter_widget.dart';

import '../../home/widgets/home_card_widget.dart';
import '../../home/widgets/notification_service_widget.dart';

class ExploreRestaurantPage extends StatefulWidget {
  const ExploreRestaurantPage({super.key});
  @override
  State<ExploreRestaurantPage> createState() => ExploreRestaurantPageState();
}

class ExploreRestaurantPageState extends State<ExploreRestaurantPage> {
  late final TextEditingController textEditingController;
  late final PageController pageController;
  final restaurants = [
    const RestaurantModel(
      url: 'assets/images/vegan.png',
      title: 'Vegan Resto',
      time: '12 Mins',
    ),
    const RestaurantModel(
      url: 'assets/images/heathly.png',
      title: 'Healthy Food',
      time: '8 Mins',
    ),
    const RestaurantModel(
      url: 'assets/images/heathly.png',
      title: 'Healthy Food',
      time: '8 Mins',
    ),
  ];
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height - padding.top,
          maxWidth: size.width,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/images/background_sliced.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                top: padding.top + 60,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 233,
                      child: TextWidget.inter(
                        'Find Your Favorite Food',
                        style: const TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NotificationServiceWidget(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/notifications');
                      },
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          boxShadow: const [],
                          height: 50,
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                          ),
                          fillColor: themeData.brightness == Brightness.light ? const Color(0xFFFEF6ED) : context.appTheme.white,
                          prefix: SvgPicture.asset(
                            'assets/images/search.svg',
                            color: themeData.brightness == Brightness.light ? context.appTheme.orange : Colors.white,
                          ),
                          hint: 'What do you want to order?',
                          hintColor: themeData.brightness == Brightness.light ? const Color(0xFFF2C2A2) : Colors.white.withOpacity(.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9.0,
                        ),
                        child: HomeButtonFilterWidget(
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget.inter(
                        'Nearest Restaurant',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextWidget.inter(
                        'View More',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFF7C32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(right: 31, left: 31, top: 20),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 184,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 4,
                ),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: HomeCardWidget(
                      url: restaurant.url,
                      time: restaurant.time,
                      title: restaurant.title,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
