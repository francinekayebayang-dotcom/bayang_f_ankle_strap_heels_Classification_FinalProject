import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/classification_provider.dart';
import 'screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/charts_screen.dart';
import 'screens/class_info_screen.dart';

void main() {
  runApp(const ShoeClassifierApp());
}

class ShoeClassifierApp extends StatelessWidget {
  const ShoeClassifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClassificationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StrapSense',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xFFE91E63),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFE91E63),
            secondary: Color(0xFFFFFFFF),
            surface: Color(0xFFFFFFFF),
            error: Color(0xFFE91E63),
            onPrimary: Color(0xFFFFFFFF),
            onSecondary: Color(0xFFE91E63),
            onSurface: Color(0xFF000000),
            onError: Color(0xFFFFFFFF),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const ChartsScreen(),
    const ClassInfoScreen(),
  ];

  // Modern color palette - white dominant with plain white and fuchsia accents
  final Color pureWhite = const Color(0xFFFFFFFF);
  final Color plainWhite = const Color(0xFFFFFFFF);
  final Color fuchsiaAccent = const Color(0xFFE91E63);
  final LinearGradient iconGradient = const LinearGradient(
    colors: [Color(0xFFE91E63), Color(0xFFFFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: pureWhite,
          boxShadow: [
            BoxShadow(color: fuchsiaAccent.withOpacity(0.1), blurRadius: 10),
          ],
        ),
        child: NavigationBar(
          height: 65,
          backgroundColor: pureWhite,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            _buildGradientDestination(Icons.camera_alt, 'Classify', 0),
            _buildGradientDestination(Icons.history, 'History', 1),
            _buildGradientDestination(Icons.bar_chart, 'Charts', 2),
            _buildGradientDestination(Icons.style, 'Styles', 3),
          ],
        ),
      ),
    );
  }

  NavigationDestination _buildGradientDestination(
    IconData iconData,
    String label,
    int index,
  ) {
    return NavigationDestination(
      icon: ShaderMask(
        shaderCallback: (bounds) => iconGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Icon(iconData, color: Colors.white),
      ),
      selectedIcon: ShaderMask(
        shaderCallback: (bounds) => iconGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Icon(iconData, color: Colors.white),
      ),
      label: label,
    );
  }
}
