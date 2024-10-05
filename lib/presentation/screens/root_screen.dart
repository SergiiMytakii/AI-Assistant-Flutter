import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:my_template/injection.dart';
import 'package:my_template/presentation/bloc/bloc/auth_bloc.dart';

class RootScreen extends StatefulWidget {
  final Widget? child;
  const RootScreen({super.key, this.child});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _buildWebRootBody(context);
    } else {
      return _buildMobileRootBody(context);
    }
  }

  Scaffold _buildWebRootBody(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(const Size.fromHeight(300)),
                  child: NavigationRail(
                    selectedIndex: _selectedIndex,
                    labelType: NavigationRailLabelType.selected,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      switch (index) {
                        case 0:
                          context.go('/somepage');
                          break;
                        case 1:
                          context.go('/notifications');
                          break;
                        case 2:
                          context.go('/bible-study');
                          break;
                        case 3:
                          context.go('/video');
                          break;
                        case 4:
                          context.go('/feedbacks');
                        case 5:
                          context.go('/q&a');
                          break;
                      }
                    },
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.music_note),
                        label: Text('Songs'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.notifications),
                        label: Text('Notifications'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.menu_book),
                        label: Text('Bible Study'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    getIt<AuthenticationBloc>()
                        .add(const AuthenticationEvent.signOutRequested());
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.child ?? const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildMobileRootBody(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex ?? 0,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/somepage');
              break;
            case 1:
              context.go('/notifications');
              break;
            case 2:
              context.go('/bible-study');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Bible Study',
          ),
        ],
      ),
    );
  }
}
