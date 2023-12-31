import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class LabelChipCodePage extends StatefulWidget {
  const LabelChipCodePage({super.key});

  @override
  State<LabelChipCodePage> createState() => _LabelChipCodePageState();
}

class _LabelChipCodePageState extends State<LabelChipCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Label Chip'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Clipboard.setData(const ClipboardData(text: _DartCode.template));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Text copied to clipboard'),
                ),
              );
            },
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
      body: SyntaxView(
        code: _DartCode.template,
        syntax: Syntax.DART,
        syntaxTheme: SyntaxTheme.standard(),
        fontSize: 20.0,
        withZoom: true,
        withLinesCount: true,
        expanded: true,
      ),
    );
  }
}

class _DartCode {
  static const template = '''
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
''';
}
