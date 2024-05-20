import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/curved_edges/curved_edges.dart';

class GCurvedEdgeWidget extends StatelessWidget {
  const GCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GCostumCurvedEdges(),
      child: child,
    );
  }
}
