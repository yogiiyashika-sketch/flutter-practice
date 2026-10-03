import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Customize Your App ✨',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Choose Your Theme 🎨',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Make your thoughts feel more personal.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // Soft Pink
            themeCard(
              context,
              '🌸',
              'Soft Pink',
              'Cute & peaceful',
              const Color(0xFFFFE4E1),
            ),

            const SizedBox(height: 15),

            // Nature
            themeCard(
              context,
              '🌿',
              'Nature',
              'Fresh & calming',
              const Color(0xFFDFF0D8),
            ),

            const SizedBox(height: 15),

            // Dark
            themeCard(
              context,
              '🌙',
              'Dark',
              'Simple & relaxing',
              const Color(0xFF2C2C34),
            ),

            const SizedBox(height: 15),

            // Minimal
            themeCard(
              context,
              '☁️',
              'Minimal',
              'Clean & simple',
              const Color(0xFFEDEDED),
            ),

            const SizedBox(height: 30),

            const Text(
              'Choose Font ✍️',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: DropdownButton<String>(
                value: 'Classic',
                isExpanded: true,
                underline: const SizedBox(),

                items: const [
                  DropdownMenuItem(
                    value: 'Classic',
                    child: Text('Classic'),
                  ),
                  DropdownMenuItem(
                    value: 'Elegant',
                    child: Text('Elegant'),
                  ),
                  DropdownMenuItem(
                    value: 'Simple',
                    child: Text('Simple'),
                  ),
                ],

                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget themeCard(
    BuildContext context,
    String emoji,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize: 30),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ],
      ),
    );
  }
}