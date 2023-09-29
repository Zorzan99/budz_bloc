import 'package:budz_bloc/app/core/ui/helpers/size_extensions.dart';
import 'package:budz_bloc/app/core/ui/styles/colors_app.dart';
import 'package:budz_bloc/app/pages/chatbox/chatbox_page.dart';
import 'package:budz_bloc/app/pages/home/home_router.dart';
import 'package:budz_bloc/app/pages/jornada/jornada_page.dart';
import 'package:budz_bloc/app/pages/profile/profile_router.dart';
import 'package:flutter/material.dart';

class IndexedPage extends StatefulWidget {
  const IndexedPage({super.key});

  @override
  State<IndexedPage> createState() => _IndexedPageState();
}

class _IndexedPageState extends State<IndexedPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeRouter.page,
    const JornadaPage(),
    const ChatboxPage(),
    ProfileRouter.page,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: context.percentHeight(.08),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.travel_explore_outlined,
              ),
              label: 'Jornadas',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
              ),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Perfil',
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: context.colors.secondary,
          unselectedItemColor: context.colors.primary,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Atualize o índice selecionado
            });
          },
        ),
      ),
    );
  }
}
