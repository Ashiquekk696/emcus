import 'package:emcus/di/di.dart';
import 'package:emcus/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus/modules/auth/bloc/auth_event.dart';
import 'package:emcus/modules/auth/bloc/auth_state.dart';
import 'package:emcus/modules/dashboard/view/pages/dashboard_screen.dart';
import 'package:emcus/routes.dart';
import 'package:emcus/theme/app_colors.dart';
import 'package:emcus/theme/app_text_styles.dart';
import 'package:emcus/utils/app_toast.dart';
import 'package:emcus/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;

  final pages = const [
    DashboardScreen(),
    Center(child: Text('Maintanence', style: AppTextStyle.largeTitle)),
    Center(child: Text('Diagnosis', style: AppTextStyle.largeTitle)),
    Center(child: Text('Settings', style: AppTextStyle.largeTitle)),
  ];
  late final AuthBloc _authBloc;
  @override
  void initState() {
    super.initState();
    _authBloc = sl<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppTopBarWidget(
          onPressed: () {
            _authBloc.add(LogoutEvent());
          },
          showDrawer: true,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.logutStatus == AuthStatus.success) {
            showCustomToast("Logged Out Succesfully.");
            Navigator.pushNamed(context, Routes.login);
          }
          if (state.logutStatus == AuthStatus.failure) {
            showCustomToast(state.errorMessage ?? "");
          }
        },
        builder: (context, state) {
          return pages[currentIndex];
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Container(
          height: 85, // ⬅️ Increased height
          decoration: const BoxDecoration(
            color: AppColors.bottomBarRed,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent, // ⬅️ So container color shows
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.electrical_services_sharp),
                label: 'Maintanence',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_search_sharp),
                label: 'Diagnosis',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
