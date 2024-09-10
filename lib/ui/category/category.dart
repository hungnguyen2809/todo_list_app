import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:realm/realm.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/entities/realm/category_entity_realm.dart';
import 'package:todo_list_app/ui/extensions/color_extension.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // late int _colorIndex;
  late Color _colorSelected;
  late String _categoryName;
  late Color _bgColorSelected;
  late IconData? _iconSelected;
  late TextEditingController _categoryNameController;

  @override
  void initState() {
    super.initState();

    // _colorIndex = 0;
    _categoryName = '';
    _iconSelected = null;
    _colorSelected = const Color(0xFf9B009E);
    _bgColorSelected = const Color(0xFFFC80FF);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryNameField(),
            _buildCategoryIconField(),
            _buildCategoryColorField(),
            _buildCategoryBgColorField(),
            _buildCategoryReview(),
            _buildCategoryFooterButtons(),
          ],
        ),
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
            onChanged: (text) => setState(() {
              _categoryName = text;
            }),
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

  void _handleChooseIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.material, IconPack.cupertino],
    );

    setState(() {
      _iconSelected = icon;
    });
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
            onPressed: _handleChooseIcon,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF444444),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
            child: _iconSelected != null
                ? Icon(_iconSelected, color: const Color(0xFFAFAFAF))
                : Text(
                    "category_icon_hint".tr(),
                    style: const TextStyle(fontSize: 12, color: Color(0xFFAFAFAF)),
                  ),
          )
        ],
      ),
    );
  }

  // void _handlePressColor(int index) {
  //   setState(() {
  //     _colorIndex = index;
  //   });
  // }

  void _handleChooseColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _colorSelected,
              onColorChanged: (Color color) {
                setState(() {
                  _colorSelected = color;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryColorField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_icon_color".tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _handleChooseColor,
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: _colorSelected,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          )
          // Container(
          //   height: 36,
          //   width: double.infinity,
          //   margin: const EdgeInsets.only(top: 10),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: AppData.listColor.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () => _handlePressColor(index),
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: const EdgeInsets.only(right: 12),
          //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppData.listColor[index]),
          //           child: _colorIndex == index ? const Icon(Icons.check, color: Colors.white) : null,
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  void _handleChooseBgColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _bgColorSelected,
              onColorChanged: (Color color) {
                setState(() {
                  _bgColorSelected = color;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryBgColorField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_background_color".tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: _handleChooseBgColor,
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: _bgColorSelected,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          )
          // Container(
          //   height: 36,
          //   width: double.infinity,
          //   margin: const EdgeInsets.only(top: 10),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: AppData.listColor.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () => _handlePressColor(index),
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: const EdgeInsets.only(right: 12),
          //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppData.listColor[index]),
          //           child: _colorIndex == index ? const Icon(Icons.check, color: Colors.white) : null,
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildCategoryReview() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("category_preview".tr()),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                margin: const EdgeInsets.only(bottom: 8, top: 10),
                decoration: BoxDecoration(
                  color: _bgColorSelected,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(_iconSelected, color: _colorSelected, size: 35),
              ),
              Text(
                _categoryName,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  void _handleCreateCategory() async {
    if (_categoryName.trim().isEmpty || _iconSelected == null) {
      const snackBar = SnackBar(
        content: Text(
          'Category not empty or Category icon not selected',
          style: TextStyle(fontSize: 16),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    try {
      final config = Configuration.local([CategoryEntityRealm.schema]);
      final realm = Realm(config);

      final category = CategoryEntityRealm(
        ObjectId(),
        _categoryName.trim(),
        color: _bgColorSelected.toHex(),
        iconColor: _colorSelected.toHex(),
        iconCodePoint: _iconSelected?.codePoint,
      );

      await realm.writeAsync(() {
        realm.add(category);
      });
      realm.close();

      const snackBar = SnackBar(
        backgroundColor: Color(0xFFf8fff8),
        content: Text(
          'Created category successfully',
          style: TextStyle(fontSize: 16, color: Color(0xFF188116)),
        ),
      );

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // reset data
      setState(() {
        _categoryName = '';
        _iconSelected = null;
        _colorSelected = const Color(0xFf9B009E);
        _bgColorSelected = const Color(0xFFFC80FF);
      });
    } catch (error) {
      print("_handleCreateCategory: $error");
      const snackBar = SnackBar(
        content: Text(
          'Create category error',
          style: TextStyle(fontSize: 16),
        ),
      );

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
              onPressed: _handleCreateCategory,
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
