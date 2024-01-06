import 'dart:io';

import 'package:devhyeon_tools/component/chip/label_chip.dart';
import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
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
    Brightness currentSystemBrightness = MediaQuery.of(context).platformBrightness;

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
              Clipboard.setData(
                  ClipboardData(
                      text: LabelChip.getDartCode(),
                  ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.getLocaleString(LocaleString.clipboardCopyMessage),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
      body: SyntaxView(
        code: LabelChip.getDartCode(),
        syntax: Syntax.DART,
        syntaxTheme: currentSystemBrightness == Brightness.dark ? SyntaxTheme.vscodeDark() : SyntaxTheme.vscodeLight(),
        fontSize: 12.0,
        withZoom: true,
        withLinesCount: true,
        expanded: true,
      ),
    );
  }
}
