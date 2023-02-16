import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_photo_gallary/business_logic/home_cubit/home_cubit.dart';
import 'package:online_photo_gallary/business_logic/log_in_cubit/log_in_cubit.dart';
import 'package:online_photo_gallary/business_logic/upload_cubit/upload_cubit.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'package:online_photo_gallary/core/helper/services_helper.dart';
import 'package:online_photo_gallary/presentation/screens/home_screen.dart';
import 'package:online_photo_gallary/presentation/screens/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesHelper.intiDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogInCubit()),
        BlocProvider(create: (context) => HomeCubit()..getImages()),
        BlocProvider(create: (context) => UploadCubit()),
      ],
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  String _savedtoken = '';
  @override
  void initState() {
    super.initState();
    _loadSavedToken();
  }

  Future<void> _loadSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedtoken = prefs.getString('token') ?? '';
      ApiConstant.token = prefs.getString('token') ?? '';
      print(' ApiConstant.token==============================');
      print(ApiConstant.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: _savedtoken.isEmpty ? const LogInScreen() : const HomeScreen(),
    );
  }
}
