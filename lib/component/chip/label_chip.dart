import 'package:flutter/material.dart';

/// {@tool snippet}
///
/// ```dart
/// LabelChip(
///   text: '#TAG6',
///   textStyle: const TextStyle(
///     color: Colors.white
///   ),
///   backgroundColor: Colors.greenAccent,
///   borderRadius: BorderRadius.circular(2.0),
///   padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
/// )
/// ```
/// {@end-tool}
class LabelChip extends StatelessWidget {
  LabelChip({
    super.key,
    required this.text,
    this.textStyle,
    this.borderRadius,
    this.padding,
    required this.backgroundColor,
  }) : assert(
    text.isNotEmpty,
    'Text should not be empty.',
  );
  final String text;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: padding,
        constraints: const BoxConstraints(
          minHeight: 24,
        ),
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundColor
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

Widget labelChipSampleList = Wrap(
  spacing: 4.0,
  runSpacing: 4.0,
  children: [
    LabelChip(
      text: '#TAG',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(99.0),
      padding: const EdgeInsets.all(8),
    ),
    LabelChip(
      text: '#TAG2',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(15.0),
      padding: const EdgeInsets.all(8),
    ),
    LabelChip(
      text: '#TAG3',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(2.0),
      padding: const EdgeInsets.all(8),
    ),
    LabelChip(
      text: '#TAG4',
      textStyle: const TextStyle(
        color: Colors.white
      ),
      backgroundColor: Colors.black12,
      borderRadius: BorderRadius.circular(99.0),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    ),
    LabelChip(
      text: '#TAG5',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(15.0),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    ),
    LabelChip(
      text: '#TAG6',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(2.0),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    ),
    LabelChip(
      text: '😊emoji-1',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(2.0),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    ),
    LabelChip(
      text: '📌emoji-2',
      textStyle: null,
      backgroundColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(2.0),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
    ),
  ],
);