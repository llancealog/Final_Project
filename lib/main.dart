import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'printers.dart';
import 'history.dart';
import 'profile.dart';

void main() {
  runApp(const CampusPrintingApp());
}

class CampusPrintingApp extends StatelessWidget {
  const CampusPrintingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Printing System',
      theme: ThemeData(
        primaryColor: const Color(0xFFDC143C), // Crimson red
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDC143C),
          primary: const Color(0xFFDC143C),
          secondary: const Color(0xFFDC143C),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  final String srCode;

  const MainNavigationScreen({super.key, required this.srCode});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pageWidgets;
  late List<String> _titles;

  @override
  void initState() {
    super.initState();
    _pageWidgets = [
      _buildPrintersContent(),
      _buildHistoryContent(),
      _buildProfileContent(),
    ];
    
    _titles = [
      'Find Available Printer',
      'Print History',
      'My Profile'
    ];
  }

  Widget _buildPrintersContent() {
    return PrintersPage(srCode: widget.srCode);
  }
  
  Widget _buildHistoryContent() {
    return HistoryPage(srCode: widget.srCode);
  }
  
  Widget _buildProfileContent() {
    return ProfilePage(srCode: widget.srCode);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFDC143C),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          if (_selectedIndex == 2) // Only show logout on profile page
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final widget in _pageWidgets)
            Container(
              color: Colors.white,
              child: widget,
            ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.print), label: 'Printers'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFFDC143C),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
