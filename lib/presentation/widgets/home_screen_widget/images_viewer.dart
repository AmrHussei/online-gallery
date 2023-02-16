import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_photo_gallary/business_logic/home_cubit/home_cubit.dart';

import '../../../core/my_colors.dart';

class ImagesViewer extends StatelessWidget {
  const ImagesViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> images = BlocProvider.of<HomeCubit>(context).images;
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
         if()
        },
      ),
    );
  }
}
