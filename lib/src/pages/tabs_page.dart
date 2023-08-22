import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/pages/tab1_page.dart';
import 'package:provider_app/src/pages/tab2_page.dart';
import 'package:provider_app/src/theme/theme.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation();

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (value) => navigationModel.currentPage = value,
      items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline, 
          color: myTheme.primaryColor,
          ),
        label: 'Para ti',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.public,
          color: myTheme.primaryColor,
          ),
        label: 'Encabezados',
      ),
    ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  set currentPage(int page){
    _currentPage = page;
    pageController.animateToPage(page, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}