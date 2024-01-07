import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/component/chip/label_chip.dart';
import 'package:devhyeon_tools/config/colors.dart';
import 'package:devhyeon_tools/dialog/color_change_dialog.dart';
import 'package:devhyeon_tools/dialog/number_change_dialog.dart';
import 'package:devhyeon_tools/dialog/text_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class LabelChipDetailPage extends StatefulWidget {
  const LabelChipDetailPage({super.key});

  @override
  State<LabelChipDetailPage> createState() => _LabelChipDetailPageState();
}

class _LabelChipDetailPageState extends State<LabelChipDetailPage> {
  var labelChipText = 'Label Chip';
  var labelChipTextSize = 14.0;
  Color? labelChipTextColor = Colors.black38;
  Color? labelChipBackgroundColor = Colors.lightBlueAccent;
  var labelChipBorderRadius = 0.0;
  var labelChipHorizontalPadding = 0.0;
  var labelChipVerticalPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Label Chip'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ThemeColor.getAppForegroundColor(context: context),
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로 가기 기능
          },
        ),
      ),
      backgroundColor: ThemeColor.getAppScaffoldColor(context: context),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
            overscroll: false,
            physics: const ClampingScrollPhysics(),
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  StickyHeader(
                    header: Container(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                          color: ThemeColor.getAppBackgroundColor(
                              context: context)),
                      child: Center(
                        child: labelChipText.isNotEmpty
                            ? LabelChip(
                                text: labelChipText,
                                textStyle: TextStyle(
                                    fontSize: labelChipTextSize,
                                    color: labelChipTextColor),
                                backgroundColor:
                                    labelChipBackgroundColor ?? Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(labelChipBorderRadius)),
                                padding: EdgeInsets.symmetric(
                                  vertical: labelChipVerticalPadding,
                                  horizontal: labelChipHorizontalPadding,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Wrap(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return TextChangeDialog(
                                      title: 'Label Chip Text',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (text) {
                                        setState(() => labelChipText = text);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.abc,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Text',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NumberChangeDialog(
                                      title: 'Label Chip Text Size',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (size) {
                                        setState(
                                            () => labelChipTextSize = size);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.format_size,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Text Size',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ColorChangeDialog(
                                      title: 'Label Text Color',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (color) {
                                        setState(
                                            () => labelChipTextColor = color);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.brush,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Text Color',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NumberChangeDialog(
                                      title: 'Label Chip Border Radius',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (size) {
                                        setState(
                                            () => labelChipBorderRadius = size);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.architecture_sharp,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Border Radius',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NumberChangeDialog(
                                      title: 'Label Chip Horizontal Padding',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (size) {
                                        setState(() =>
                                            labelChipHorizontalPadding = size);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.architecture_sharp,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Horizontal Padding',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NumberChangeDialog(
                                      title: 'Label Chip Vertical Padding',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (size) {
                                        setState(() =>
                                            labelChipVerticalPadding = size);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.architecture_sharp,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Vertical Padding',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ColorChangeDialog(
                                      title: 'Label Chip Color',
                                      description: 'this is set chip text..',
                                      onClickCancel: () =>
                                          Navigator.of(context).pop(),
                                      onClickApply: (color) {
                                        setState(() =>
                                            labelChipBackgroundColor = color);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonOverlayColor(
                                    context: context);
                              }),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return ThemeColor.getIconButtonBackgroundColor(
                                    context: context);
                              }),
                            ),
                            icon: Icon(
                              Icons.brush,
                              color: ThemeColor.getAppForegroundColor(
                                  context: context),
                            ),
                            label: Text(
                              'Change Chip Color',
                              style: TextStyle(
                                color: ThemeColor.getAppForegroundColor(
                                    context: context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999.0),
                    color: ThemeColor.getIconButtonBackgroundColor(context: context),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.codeLabelChip);
                    },
                    tooltip: 'show code',
                    icon: Icon(
                      Icons.code,
                      color: ThemeColor.getAppForegroundColor(context: context),
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
