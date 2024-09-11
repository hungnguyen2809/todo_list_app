import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/data/model/category.dart';
import 'package:todo_list_app/entities/realm/category_entity_realm.dart';
import 'package:todo_list_app/ui/category/category.dart';
import 'package:todo_list_app/ui/extensions/string_extension.dart';

import '../../contains/ui.dart';

class ChooseCategoryWidget extends StatefulWidget {
  const ChooseCategoryWidget({super.key});

  @override
  State<ChooseCategoryWidget> createState() => _ChooseCategoryWidgetState();
}

class _ChooseCategoryWidgetState extends State<ChooseCategoryWidget> {
  late bool _isEditMode = false;
  late List<CategoryModel> _listCategory = [];

  @override
  void initState() {
    super.initState();

    // hàm này đc go khi mà có 1 frame đc add hay đc khởi tạo lên màn hình
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCategoryList();
    });
  }

  Future<void> _getCategoryList() async {
    final config = Configuration.local([CategoryEntityRealm.schema]);
    final realm = Realm(config);
    final categories = realm.all<CategoryEntityRealm>();
    final categoryModels = categories
        .map((item) => CategoryModel(
              id: item.id.hexString,
              name: item.name,
              bgColor: item.bgColor,
              iconColor: item.iconColor,
              iconCodePoint: item.iconCodePoint,
            ))
        .toList();

    setState(() {
      _listCategory = categoryModels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF363636),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeadTitle(),
              _buildBodyContent(),
              _isEditMode ? _buildFooterCanEdit() : _buildFooterAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "category_choose".tr(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFF979797)),
        ],
      ),
    );
  }

  Widget _buildBodyContent() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _listCategory.length + 1,
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // chia ra làm 3 cột
        childAspectRatio: 1, // tỷ lệ khoảng cách giữa các hàng của item
      ),
      itemBuilder: (context, index) {
        if (index == _listCategory.length) {
          return _buildItemAddCategory();
        }
        return _buildItemCategory(_listCategory[index]);
      },
    );
  }

  void _handleChooseCate(CategoryModel category) {
    if (_isEditMode) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryScreen(isCreate: false, categoryModel: category);
      }));
    } else {
      Navigator.pop(context, category);
    }
  }

  Widget _buildItemCategory(CategoryModel category) {
    return GestureDetector(
      onTap: () => _handleChooseCate(category),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(bottom: 8, top: 10),
            decoration: BoxDecoration(
                color: category.bgColor?.toHexColor(),
                borderRadius: BorderRadius.circular(6),
                border: _isEditMode ? Border.all(width: 2, color: Colors.orange) : null),
            child: category.iconCodePoint != null
                ? Icon(
                    size: 35,
                    color: category.iconColor?.toHexColor(),
                    IconData(category.iconCodePoint!, fontFamily: "MaterialIcons"),
                  )
                : null,
          ),
          Text(category.name, style: const TextStyle(fontSize: 14, color: Colors.white))
        ],
      ),
    );
  }

  void _handleCreateCategory() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const CategoryScreen(isCreate: true);
    }));
  }

  Widget _buildItemAddCategory() {
    return GestureDetector(
      onTap: _handleCreateCategory,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(bottom: 8, top: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF80FFD1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(size: 35, color: Color(0xFF00A369), Icons.add),
          ),
          const Text('Create New', style: TextStyle(fontSize: 14, color: Colors.white))
        ],
      ),
    );
  }

  Widget _buildFooterAction() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 48,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(
                  "cancel".tr(),
                  style: TextStyle(color: UIContains.colorPrimary, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => setState(() {
                  _isEditMode = true;
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: UIContains.colorPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(
                  "edit".tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterCanEdit() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 25),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => setState(() {
            _isEditMode = false;
          }),
          style: ElevatedButton.styleFrom(
            backgroundColor: UIContains.colorPrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          child: Text(
            "cancel".tr(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
