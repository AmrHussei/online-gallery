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
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is LoadingImage) {
        return const Center(
          child: Text('Loadingggggggggggggg'),
        );
      } else if (state is ErrorImage) {
        return const Center(
          child: Text('Errorrrrrrrrrrrrr'),
        );
      } else if (state is LoadedImage) {
        return Expanded(
          child: GridView.builder(
            itemCount: (state).listofImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                mainAxisSpacing: 16.w,
                crossAxisCount: 3,
                crossAxisSpacing: 16.h),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage((state)
                        .listofImages[(state).listofImages.length - index - 1]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
