import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:fluttterguys_good_layout_reference/models/category_model.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      //AppBar
      appBar: appBarMethod('Tester'),
      backgroundColor: Colors.white,

      //Main Page Body
      body: _categoriesSection(),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchField(),
        SizedBox(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.1),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Pancakes',
          hintStyle: TextStyle(color: Color(0xffdddada), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 8,
                      top: 8,
                      bottom: 8,
                    ),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBarMethod(String titleText) {
    return AppBar(
      title: Text(
        titleText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,

      //leftButton
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),

      //rightButton
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
