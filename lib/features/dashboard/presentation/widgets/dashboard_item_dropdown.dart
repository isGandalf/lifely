import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DashboardItemDropDown extends StatelessWidget {
  const DashboardItemDropDown({
    super.key,
    required this.selectedClass,
    required this.classNames,
  });

  final String selectedClass;
  final List<String> classNames;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownSearch<String>(
        decoratorProps: const DropDownDecoratorProps(
          decoration: InputDecoration(),
          baseStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        selectedItem: selectedClass,
        items: (filter, loadProps) => classNames,

        popupProps: PopupProps.menu(
          fit: FlexFit.loose,
          menuProps: MenuProps(backgroundColor: AppColors.scaffoldBackground),
        ),
        onChanged: (value) {
          if (value != null) {
            context.read<DashboardBloc>().add(
              DashboardDataClassChangeEvent(classname: value),
            );
          }
        },
      ),
    );
  }
}
