import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 50.h,
          width: 350.w,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'What do you search for?',
              hintStyle: TextStyle(
                  color: const Color(0xffb2b2b2),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              prefixIcon: Icon(
                Icons.search_sharp,
                color: Colors.blue.shade900,
                size: 35,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Colors.blue.shade900, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 5),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        ImageIcon(
          const AssetImage('assets/images/img_4.png'),
          size: 24.sp,
          color: Colors.blue.shade900,
        ),
        SizedBox(
          width: 10.sp,
        )
      ],
    );
  }
}
