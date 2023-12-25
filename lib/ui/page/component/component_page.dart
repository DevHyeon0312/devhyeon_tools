import 'package:devhyeon_tools/application/router.dart';
import 'package:devhyeon_tools/component/chip/label_chip.dart';
import 'package:devhyeon_tools/ui/page/component/widget/component_list_item_widget.dart';
import 'package:devhyeon_tools/utils/app_util.dart';
import 'package:devhyeon_tools/utils/device_info.dart';
import 'package:flutter/material.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400.0, // 각 아이템의 최대 너비
          crossAxisSpacing: 8.0, // 열 간의 간격
          mainAxisSpacing: 8.0, // 행 간의 간격
          childAspectRatio: 1.2, // 높이와 너비의 비율을 1:1로 유지
        ),
        itemCount: getComponentListItemWidgets(context).length, // 아이템 개수
        itemBuilder: (context, index) {
          return getComponentListItemWidgets(context)[index];
        },
      ),
    );
  }

  List<ComponentListItemWidget> getComponentListItemWidgets(BuildContext context) => [
    ComponentListItemWidget(
      component: labelChipSampleList,
      name: 'Label Chip',
      description: 'Use for simple badges or hashtags.',
      onClickDetailButton: () {
        Navigator.pushNamed(context, RouteName.detailLabelChip);
      },
      onClickCodeButton: () {
        final snackBar = SnackBar(
          content: const Text('Coming Soon..'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Undo 기능 추가
              // 여기에 Undo를 눌렀을 때 수행할 동작을 추가할 수 있습니다.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    ),
  ];
}