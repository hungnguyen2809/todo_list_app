import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../contains/ui.dart';

class TaskPriority extends StatefulWidget {
  const TaskPriority({super.key});

  @override
  State<TaskPriority> createState() => _TaskPriorityState();
}

class _TaskPriorityState extends State<TaskPriority> {
  late int _priority = 1;

  @override
  void initState() {
    super.initState();
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
              _buildFooterAction(),
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
            "task_priority".tr(),
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
      itemCount: 10,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // chia ra làm 3 cột
        childAspectRatio: 1, // tỷ lệ khoảng cách giữa các hàng của item
      ),
      itemBuilder: (context, index) {
        return _buildItemCategory(index + 1);
      },
    );
  }

  void _handleChoosePriority(int index) {
    setState(() {
      _priority = index;
    });
  }

  Widget _buildItemCategory(int index) {
    return GestureDetector(
      onTap: () => _handleChoosePriority(index),
      child: Container(
        width: 64,
        height: 64,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _priority == index ? UIContains.colorPrimary : const Color(0xFF272727),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.flag, color: Colors.white),
            Text(index.toString(), style: const TextStyle(color: Colors.white, fontSize: 16))
          ],
        ),
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
                onPressed: () => Navigator.pop(context, {"priority": _priority}),
                style: ElevatedButton.styleFrom(
                  backgroundColor: UIContains.colorPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(
                  "save".tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
