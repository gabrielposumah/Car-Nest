import 'package:flutter/material.dart';
import 'package:product_share_suzuki/common/widgets/costum_Shapes/container/circular_container.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/helpers/helper_functions.dart';

class GChoiceChip extends StatelessWidget {
  const GChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = GHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Gcolors.white : null),
        avatar: isColor
            ? GCircularContainer(
                widht: 50,
                height: 50,
                backgroundColor: GHelperFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? GHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
