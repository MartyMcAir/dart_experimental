import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:using_slivers_rhythm/rhytme/v3_auto_router/ui/widgets/base_container.dart';

import '../widgets/index.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: Text('Settings'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5)), // отступ
          SliverToBoxAdapter(
            child: SettingsTogglesList(
              title: 'Dark Theme',
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsTogglesList(
              title: 'Notification',
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsTogglesList(
              title: 'Analyst accept',
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)), // отступ
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Clean up All History',
              onTap: () {},
              iconData: Icons.delete_outline_sharp,
              iconColor: theme.primaryColor,
            ),
            //   Padding(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            // child: BaseConatiner(
            //     child:
            // ListTile(
            //   title: Text('Clean History'),
            //   subtitle: Text('cashe history'),
            //   contentPadding: EdgeInsets.zero,
            //   leading: Icon(Icons.delete),
            // ),  ),  )
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Support',
              onTap: () {},
              iconData: Icons.message_outlined,
              iconColor: theme.primaryColorDark,
            ),
          )
        ],
      ),
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard(
      {super.key,
      required this.title,
      this.onTap,
      required this.iconData,
      this.iconColor});

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseConatiner(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
