import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotong_contents_promo/navigation/nav_items.dart';
import 'package:sotong_contents_promo/theme/promo_theme.dart';
import 'package:sotong_contents_promo/widgets/app_sidebar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const double desktopBreakpoint = 768;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppShell.desktopBreakpoint;

    if (isDesktop) {
      return Scaffold(
        backgroundColor: PromoTheme.pageBg,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: AppSidebar.width,
              child: AppSidebar(currentLocation: location),
            ),
            Expanded(child: widget.child),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PromoTheme.pageBg,
      appBar: AppBar(
        backgroundColor: PromoTheme.sidebarBg,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(NavItems.titleFor(location)),
        leading: IconButton(
          tooltip: '메뉴 열기',
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        width: AppSidebar.width,
        backgroundColor: PromoTheme.sidebarBg,
        child: AppSidebar(
          currentLocation: location,
          onNavigate: (route) {
            Navigator.of(context).maybePop();
            context.go(route);
          },
        ),
      ),
      body: widget.child,
    );
  }
}
