import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final Widget? child;

  const DashboardHeader({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
   // final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 25, 24, 22),
      decoration: const BoxDecoration(
        color: Color(0xFF0D5B43),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Martes 12 de agosto 2026',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (child != null) ...[
            const SizedBox(height: 20),
            child!,
          ]
        ],
      ),
    );
  }
}