import 'package:flutter/material.dart';

class ComponentListItemWidget extends StatefulWidget {
  const ComponentListItemWidget({super.key, required this.component, required this.name, required this.onClickDetailButton, required this.onClickCodeButton});
  final Widget component;
  final String name;
  final VoidCallback onClickDetailButton;
  final VoidCallback onClickCodeButton;

  @override
  State<ComponentListItemWidget> createState() => _ComponentListItemWidgetState();
}

class _ComponentListItemWidgetState extends State<ComponentListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(1),
        color: Colors.blueAccent,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ),
              const SizedBox(height: 8,),
              widget.component,
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    widget.onClickDetailButton.call();
                  }, child: const Text('Detail')),
                  TextButton(onPressed: () {
                    widget.onClickCodeButton.call();
                  }, child: const Text('Code'))
                ],
              )
            ],
          ),
        )
    );
  }
}