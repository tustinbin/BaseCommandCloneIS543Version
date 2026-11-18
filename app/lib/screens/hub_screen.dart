import 'package:material_ui/material_ui.dart';

import 'decks_screen.dart';
import 'home_screen.dart';
import 'shop_screen.dart';

/// Landscape hub: Shop ← Home → Decks (swipe).
class HubScreen extends StatefulWidget {
  const HubScreen({super.key});

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  late final PageController _controller;
  int _index = 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _go(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _index = i),
              children: const [
                ShopScreen(),
                HomeScreen(),
                DecksScreen(),
              ],
            ),
          ),
          _HubTabs(index: _index, onSelect: _go),
        ],
      ),
    );
  }
}

class _HubTabs extends StatelessWidget {
  const _HubTabs({required this.index, required this.onSelect});

  final int index;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    const labels = ['SHOP', 'HOME', 'DECKS'];
    return Material(
      color: const Color(0xEE0B1220),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Row(
            children: [
              for (var i = 0; i < labels.length; i++)
                Expanded(
                  child: TextButton(
                    onPressed: () => onSelect(i),
                    child: Text(
                      labels[i],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.4,
                        color: i == index
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0x99FFFFFF),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
