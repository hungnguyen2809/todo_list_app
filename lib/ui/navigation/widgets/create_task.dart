import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/category/choose_category.dart';

import '../../../contains/ui.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({super.key});

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    //
    _nameController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(28),
          child: _buildBodyWidget(),
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskTitle(),
          _buildTaskNameField(),
          _buildTaskDescField(),
          _buildTaskActionButton(),
        ],
      ),
    );
  }

  Widget _buildTaskTitle() {
    return Text(
      "task_add".tr(),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _buildTaskNameField() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: TextFormField(
        controller: _nameController,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintText: "task_name".tr(),
          hintStyle: const TextStyle(fontSize: 18, color: Color(0xFFAFAFAF)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskDescField() {
    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 35),
      child: TextFormField(
        controller: _descController,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintText: "task_desc".tr(),
          hintStyle: const TextStyle(fontSize: 18, color: Color(0xFFAFAFAF)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
          ),
        ),
      ),
    );
  }

  void _showChooseCategory() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, animation2) => const ChooseCategoryWidget(),
    );
  }

  Widget _buildTaskActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.timer_sharp, color: Colors.white.withOpacity(0.87)),
        ),
        IconButton(
          onPressed: _showChooseCategory,
          icon: Icon(Icons.tag, color: Colors.white.withOpacity(0.87)),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.flag, color: Colors.white.withOpacity(0.87)),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.send_outlined, color: UIContains.colorPrimary),
        ),
      ],
    );
  }
}
