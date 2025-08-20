  import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

 class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}
  final TextEditingController _controller = TextEditingController();

  bool get _isTyping => _controller.text.isNotEmpty;
class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
 return Stack(
          alignment: Alignment.centerLeft,
          children: [
            // TextField الأساسي
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                ),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                onChanged: (_) => setState(() {}),
              ),
            ),

            // Animated hint فوقه (لكن IgnorePointer = true علشان ما يمنعش الكتابة)
            if (!_isTyping)
              Positioned.fill(
                left: 48, // بعد أيقونة السيرش
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IgnorePointer(
                    ignoring: true, // ده اللي هيخلي الكتابة شغالة
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1000),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Search Products',
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Search for Milk',
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Search for Eggs',
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Search for Bread',
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );}}