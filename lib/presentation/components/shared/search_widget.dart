import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller ;
  final Function(String val) onChange;
   const SearchInput({super.key, required this.controller,required this.onChange});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear,color: AppColors.kTaupe,),
            onPressed: () {
              widget.controller.clear();
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
        onChanged: (value){
          widget.onChange(value);
        },
      ),
    );
  }
}
