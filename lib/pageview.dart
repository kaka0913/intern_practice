import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {

  const PageViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    /* スワイプの検出とスワイプ時のアニメーションを管理する controller を作成 */
    final controller = PageController(
      initialPage: 1,
      viewportFraction: 1.2,
      );
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.vertical,
      controller: controller,
      reverse: true,
      onPageChanged: (int index) {
        print('Page Changes to index $index');
      },
      children: const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        ),
      ],
    );
  }
}
