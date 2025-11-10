import 'package:flutter/material.dart';
import 'package:smart_city/core/config/gried_view_home_items.dart';

class HomeGridview extends StatelessWidget {
  final void Function(int) onNavTap;

  const HomeGridview({super.key, required this.onNavTap});

  /// Map grid index -> page index in HomePagesView (Home=0, Notification=1, Profile=2)
  int _mapGridIndexToPageIndex(int gridIndex) {
    // Adjust mapping to match your desired behavior:
    // gridIndex 0 -> Utils  (here we keep on page 0 or open separate screen later)
    // gridIndex 1 -> Complaints (same as above)
    // gridIndex 2 -> Notifications -> page index 1
    // gridIndex 3 -> Profile -> page index 2
    switch (gridIndex) {
      case 2:
        return 1; // Notifications page
      case 3:
        return 2; // Profile page
      default:
        return 0; // default to Home (or change to open new route)
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = GridViewItems.gridItems;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            final pageIndex = _mapGridIndexToPageIndex(index);
            onNavTap(pageIndex);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: (item['color'] as Color).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    size: 36,
                    color: item['color'] as Color,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item['title'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
