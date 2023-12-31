import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ["Menu items", "Reviews", "Info"];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 125;
      case 2:
        return 240;

      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 80;
      case 1:
        return 75;
      case 2:
        return 40;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0xFFF8F5F2),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: SizedBox(
                  height: 273,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    itemCount: foods.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemBuilder: (context, index) {
                      final item = foods[index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 273,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              '${item.image}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 32,
                          height: 32,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: SvgPicture.asset('assets/vectors/ic_line.svg'),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 32,
                              height: 32,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFFFFFFF),
                              ),
                              child: SvgPicture.asset(
                                  'assets/vectors/ic_heart.svg'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Container(
                  height: 168,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Delicate Fruit Salad',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E4462),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Jl. Jaya katwang no 4, Ngasem',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3E4462),
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Open 8 am - 8pm',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3E4462),
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.pin_drop, size: 16, color: Colors.blue),
                            // Icon pin
                            SizedBox(width: 4),
                            // Khoảng cách giữa icon và văn bản
                            Text(
                              '1km ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3E4462),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Icon(Icons.star, size: 16, color: Colors.yellow),
                            // Icon ngôi sao
                            SizedBox(width: 4),
                            // Khoảng cách giữa icon và văn bản
                            Text(
                              '5.0 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3E4462),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Icon(Icons.verified, size: 16, color: Colors.green),
                            // Icon dấu tích
                            SizedBox(width: 4),
                            // Khoảng cách giữa icon và văn bản
                            Text(
                              'verified',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3E4462),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 344,
            height: 35,
            child: Column(
              children: [
                SizedBox(
                  width: 344,
                  height: 35,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: 344,
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 60, top: 7),
                                child: Text(tabs[index],
                                    style: GoogleFonts.ubuntu(
                                      fontSize: current == index ? 16 : 14,
                                      fontWeight: current == index
                                          ? FontWeight.w400
                                          : FontWeight.w300,
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: 0,
                      left: changePositionedOfLine(),
                      // Đặt giá trị cụ thể vào đây thay vì gọi hàm
                      curve: Curves.fastLinearToSlowEaseIn,
                      // Sửa từ 'Curve' thành 'Curves' và chọn một loại curve
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: const EdgeInsets.only(left: 10),
                        duration: const Duration(milliseconds: 500),
                        // Thay đổi thành milliseconds
                        width: changeContainerWidth(),
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF3E4462),
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              width: 323,
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: foods.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final item = foods[index];

                  switch (index) {
                    case 0:
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 123,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      '${item.image}',
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  const Text(
                                    'Multigrain Pizza',
                                    style: TextStyle(
                                      color: Color(0xFF3E4462),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.08,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Row(
                                      children: [
                                        Text("\$18.50"),
                                        Text(
                                          '  22.500',
                                          style: TextStyle(
                                            color: Color(0xFFC9C9C9),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.10,
                                            letterSpacing: -0.24,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(" %"),
                                        ),
                                        const Text(
                                          'Free delivery ',
                                          style: TextStyle(
                                            color: Color(0xFF7E7E7E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.14,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 41, bottom: 70),
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(4, 4),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                    'assets/vectors/ic_heart.svg'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 36),
                                height: 24,
                                width: 24,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                child: SvgPicture.asset(
                                    'assets/vectors/ic_vector.svg'),
                              ),
                              Container(
                                width: 88,
                                height: 26,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF8F5F2)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFE1E1E1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color(0xFF3E4462),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0.14,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF1D2D50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      );

                    case 1:
                      return Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 123,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      '${item.image}',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Chicken Pizza',
                                      style: TextStyle(
                                        color: Color(0xFF3E4462),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.08,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$20.50',
                                            style: TextStyle(
                                              color: Color(0xFF3E4462),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: -0.24,
                                            ),
                                          ),
                                          Text(
                                            '  24.500',
                                            style: TextStyle(
                                              color: Color(0xFFC9C9C9),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: -0.24,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.cyan,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text(" %"),
                                          ),
                                          const Text(
                                            'Delivery discount up to 3K',
                                            style: TextStyle(
                                              color: Color(0xFF7E7E7E),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0.14,
                                              letterSpacing: -0.24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 0, top: 20),
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(4, 4),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                    'assets/vectors/ic_heart.svg'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 36),
                                height: 24,
                                width: 24,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                child: SvgPicture.asset(
                                    'assets/vectors/ic_vector.svg'),
                              ),
                              Container(
                                width: 88,
                                height: 26,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF8F5F2)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFE1E1E1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color(0xFF3E4462),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0.14,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF1D2D50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      );

                    default:
                      return Container(); // Empty widget for any other index
                  }
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 89,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    height: 52,
                    width: 344,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFF1D2D50),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1 item",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 70),
                        Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 70),
                        Text(
                          "\$18.50",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // Handle onTap event
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodEntity {
  String? foodName;
  String? image;

  FoodEntity({
    this.image,
    this.foodName,
  });
}

List<FoodEntity> foods = [
  FoodEntity(
    foodName: "Pizza",
    image: "assets/images/img_pizza.png",
  ),
  FoodEntity(
    foodName: "Noodle",
    image: "assets/images/img_restaurant.png",
  ),
];
