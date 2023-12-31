import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/component/chip/label_chip.dart';
import 'package:devhyeon_tools/ui/page/component/widget/component_list_item_widget.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {

  int getCrossAxisCount() {
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth < 420 ) {
      return 1;
    } else {
      return deviceWidth ~/ 300;
    }
  }

  double getMainAxisExtent() {
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth < 320) {
      return 220;
    } else if (deviceWidth < 360) {
      return 200;
    } else if (deviceWidth < 600) {
      return 180;
    } else {
      return 160;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: getCrossAxisCount(),
            mainAxisExtent: getMainAxisExtent(),
          ),
          itemCount: getComponentListItemWidgets(context).length,
          itemBuilder: (context, index) {
            return getComponentListItemWidgets(context)[index];
          },
        ),
      ),
    );
  }

  List<ComponentListItemWidget> getComponentListItemWidgets(BuildContext context) => [
    ComponentListItemWidget(
      component: labelChipSampleList,
      name: 'Label Chip',
      onClickDetailButton: () {
        Navigator.pushNamed(context, RouteName.detailLabelChip);
      },
      onClickCodeButton: () {
        Navigator.pushNamed(context, RouteName.codeLabelChip);
      },
    ),
    // ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),
    // ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),ComponentListItemWidget(
    //   component: Container(),
    //   name: 'Empty',
    //   onClickDetailButton: () {
    //
    //   },
    //   onClickCodeButton: () {
    //
    //   },
    // ),
  ];
}