import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/data/model/category.dart';
import 'package:todo_list_app/ui/category/choose_category.dart';
import 'package:todo_list_app/ui/extensions/string_extension.dart';
import 'package:todo_list_app/ui/priority/priority.dart';

import '../../../contains/ui.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({super.key});

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  late int? _priority;
  late DateTime? _dateTime;
  late CategoryModel? _category;
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    //
    _priority = null;
    _dateTime = null;
    _category = null;
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
          if (_priority != null) _buildTaskPreviewPriority(_priority!),
          if (_dateTime != null) _buildTaskPreviewDate(_dateTime!),
          if (_category != null) _buildTaskPreviewCategory(_category!),
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
      margin: const EdgeInsets.only(top: 14, bottom: 10),
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

  Widget _buildTaskPreviewDate(DateTime dateTime) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${"time".tr()} :",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            DateFormat("yyyy-MM-dd HH:mm").format(dateTime),
            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.87)),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskPreviewCategory(CategoryModel category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${"category_title".tr()} :",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(bottom: 8, top: 10),
            decoration: BoxDecoration(
              color: category.bgColor?.toHexColor(),
              borderRadius: BorderRadius.circular(6),
            ),
            child: category.iconCodePoint != null
                ? Icon(
                    size: 35,
                    color: category.iconColor?.toHexColor(),
                    IconData(category.iconCodePoint!, fontFamily: "MaterialIcons"),
                  )
                : null,
          ),
          // Text(category.name, style: const TextStyle(fontSize: 14, color: Colors.white))
        ],
      ),
    );
  }

  Widget _buildTaskPreviewPriority(int priority) {
    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${"task_priority".tr()} :",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            priority.toString(),
            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.87)),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final datePicker = await showDatePicker(
      context: context,
      firstDate: DateTime.now(), // min date
      lastDate: DateTime.now().add(const Duration(days: 365)), // max date
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(primary: UIContains.colorPrimary, onSurface: Colors.white),
        ),
        child: child!,
      ),
    );
    if (datePicker == null) return;

    if (!context.mounted) return;
    final timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(primary: UIContains.colorPrimary, onSurface: Colors.white),
        ),
        child: child!,
      ),
    );
    if (timePicker == null) return;

    datePicker.copyWith(hour: timePicker.hour, minute: timePicker.minute, second: 0);
    setState(() {
      _dateTime = datePicker;
    });
  }

  Future<void> _showChooseCategory() async {
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, animation2) => const ChooseCategoryWidget(),
    );

    if (result != null && result is CategoryModel) {
      setState(() {
        _category = result;
      });
    }
  }

  Future<void> _showChoosePriority() async {
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, animation2) => const TaskPriority(),
    );

    if (result != null && result is Map<String, dynamic>) {
      final priority = result['priority'];
      if (priority != null && priority is int) {
        setState(() {
          _priority = priority;
        });
      }
    }
  }

  Widget _buildTaskActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: _showDatePicker,
          icon: Icon(
            Icons.timer_sharp,
            color: _dateTime != null ? UIContains.colorPrimary : Colors.white.withOpacity(0.87),
          ),
        ),
        IconButton(
          onPressed: _showChooseCategory,
          icon: Icon(
            Icons.tag,
            color: _category != null ? UIContains.colorPrimary : Colors.white.withOpacity(0.87),
          ),
        ),
        IconButton(
          onPressed: _showChoosePriority,
          icon: Icon(Icons.flag, color: _priority != null ? UIContains.colorPrimary : Colors.white.withOpacity(0.87)),
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
