import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller ;

  const SearchInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear,color: AppColors.kTaupe,),
            onPressed: () {
              controller.clear();
            },
          )
              : Icon(Hicons.location_light_outline,color: AppColors.kTaupe,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.kTransparent),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.kTransparent),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.kTaupe),
          ),
          filled: true,
          fillColor: AppColors.kTaupeLight,
        ),
        onChanged: (value) {
          // Handle search logic
        },
      ),
    );
  }
}
