import 'package:devhyeon_tools/component/chip/label_chip.dart';
import 'package:devhyeon_tools/config/colors.dart';
import 'package:devhyeon_tools/extention/locale_extention.dart';
import 'package:devhyeon_tools/locale/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class LabelChipDetailPage extends StatefulWidget {
  const LabelChipDetailPage({super.key});

  @override
  State<LabelChipDetailPage> createState() => _LabelChipDetailPageState();
}

class _LabelChipDetailPageState extends State<LabelChipDetailPage> {
  var labelChipText = '';
  var labelChipTextSize = 14.0;
  Color? labelChipTextColor;
  Color? labelChipBackgroundColor;
  var labelChipBorderRadius = null;
  var labelChipPadding = null;

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
      backgroundColor: ThemeColor.getAppBackgroundColor(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                padding: const EdgeInsets.all(2.0),
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0),),
                  color: Color(0xFF212121),
                ),
                child: Center(
                  child: labelChipText.isNotEmpty ? LabelChip(
                    text: labelChipText,
                    textStyle: TextStyle(
                      fontSize: labelChipTextSize,
                      color: labelChipTextColor
                    ),
                    backgroundColor: labelChipBackgroundColor ?? Colors.white,
                    borderRadius: labelChipBorderRadius,
                    padding: labelChipPadding,
                  ) : Container(),
                ),
              ),
              Text(
                context.getLocaleString(LocaleString.widgetPreView),
                style: TextStyle(
                  color: ThemeColor.getAppForegroundColor(context: context),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0),),
                  color: Color(0xFF212121),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'text',
                      style: TextStyle(
                        color: ThemeColor.getAppForegroundColor(context: context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0),),
                        color: Color(0xFF515151),
                      ),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        cursorColor: ThemeColor.getAppForegroundColor(context: context),
                        decoration: const InputDecoration(
                          hintText: 'input text (ex.hello)',
                          hintStyle: TextStyle(
                            color: Color(0x80FFFFFF)
                          )
                        ),
                        style: TextStyle(
                          color: ThemeColor.getAppForegroundColor(context: context),
                        ),
                        onChanged: (text) {
                          setState(() {
                            labelChipText = text;
                          });
                        },
                      ),
                    ),
                    Text(
                      'textStyle',
                      style: TextStyle(
                        color: ThemeColor.getAppForegroundColor(context: context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0),),
                        color: Color(0xFF515151),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            textCapitalization: TextCapitalization.words,
                            cursorColor: ThemeColor.getAppForegroundColor(context: context),
                            decoration: const InputDecoration(
                                hintText: 'input text size (ex.14)',
                                hintStyle: TextStyle(
                                    color: Color(0x80FFFFFF)
                                )
                            ),
                            style: TextStyle(
                              color: ThemeColor.getAppForegroundColor(context: context),
                            ),
                            onChanged: (text) {
                              try {
                                var textSize = double.parse(text);
                                setState(() {
                                  labelChipTextSize = textSize;
                                });
                              } catch(_) {}
                            },
                          ),
                          const SizedBox(height: 16,),
                          HueRingPicker(
                            pickerColor: labelChipTextColor ?? Colors.white,
                            onColorChanged: (changeColor) {
                              setState(() {
                                labelChipTextColor = changeColor;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'backgroundColor',
                      style: TextStyle(
                        color: ThemeColor.getAppForegroundColor(context: context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0),),
                        color: Color(0xFF515151),
                      ),
                      child: HueRingPicker(
                        pickerColor: labelChipBackgroundColor ?? Colors.white,
                        onColorChanged: (changeColor) {
                          setState(() {
                            labelChipBackgroundColor = changeColor;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
