import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/circular_container.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/curved_edges/curved_edge_widgets.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';

class GPrimaryHeaderContainer extends StatelessWidget {
  const GPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GCurvedEdgeWidget(
      // child: SizedBox(
      //   height: 365,
      child: Container(
        color: Gcolors.black,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: GCircularContainer(
                    backgroundColor: Gcolors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: GCircularContainer(
                    backgroundColor: Gcolors.textWhite.withOpacity(0.1))),
            const Positioned(
                top: 120,
                left: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/images/xl7.png',
                    //   height: 170,
                    //   fit: BoxFit.contain,
                    // ),
                  ],
                )),
            child,
          ],
        ),
        //       ),
      ),
    );
  }
}
