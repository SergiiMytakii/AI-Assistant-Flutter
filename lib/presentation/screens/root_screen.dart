import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';

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
                          context.go('/');
                          break;
                        case 1:
                          context.go('/chatscreen');
                          break;
                        case 2:
                          context.go('/settings');
                          break;
                      }
                    },
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.home),
                        label: Text('Home'.tr()),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.notifications),
                        label: Text('Chat'.tr()),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.settings),
                        label: Text('Settings'.tr()),
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
              context.go('/');
              break;
            case 1:
              context.go('/chatscreen');
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
