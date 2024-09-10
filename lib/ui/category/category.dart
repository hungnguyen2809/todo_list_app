import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';

import '../../data/data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late int _colorIndex;
  late TextEditingController _categoryNameController;

  @override
  void initState() {
    super.initState();
    _colorIndex = 0;
    _categoryNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      appBar: AppBar(
        backgroundColor: UIContains.blackBackground,
        centerTitle: false,
        title: Text(
          "category_title_create".tr(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryNameField(),
          _buildCategoryIconField(),
          _buildCategoryColorField(),
          const Spacer(),
          _buildCategoryFooterButtons(),
        ],
      ),
    );
  }

  Widget _buildTitleField(String title) {
    return Text(
      "$title :",
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  Widget _buildCategoryNameField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_name".tr()),
          const SizedBox(height: 10),
          TextFormField(
            controller: _categoryNameController,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "category_name_hint".tr(),
              hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFAFAFAF)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIconField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_icon".tr()),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF444444),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
              child: Text(
                "category_icon_hint".tr(),
                style: const TextStyle(fontSize: 12, color: Color(0xFFAFAFAF)),
              ))
        ],
      ),
    );
  }

  void _handlePressColor(int index) {
    setState(() {
      _colorIndex = index;
    });
  }

  Widget _buildCategoryColorField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_color".tr()),
          Container(
            height: 36,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppData.listColor.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _handlePressColor(index),
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppData.listColor[index]),
                    child: _colorIndex == index ? const Icon(Icons.check, color: Colors.white) : null,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryFooterButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 48,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "cancel".tr(),
                style: TextStyle(fontSize: 16, color: UIContains.colorPrimary),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: UIContains.colorPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              child: Text(
                "category_create".tr(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
