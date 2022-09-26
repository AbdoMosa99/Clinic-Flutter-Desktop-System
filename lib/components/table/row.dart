import 'package:clinic_flutter_desktop_system/components/actions/common_buttons.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRow extends StatefulWidget {
  final List<String> values;
  final bool attendBtn;
  final bool payBtn;
  final bool cancelBtn;
  final bool isProfile;

  const AppRow({
    Key? key,
    required this.values,
    this.attendBtn = true,
    this.payBtn = true,
    this.cancelBtn = true,
    this.isProfile = false,
  }) : super(key: key);

  @override
  State<AppRow> createState() => _AppRowState();
}

class _AppRowState extends State<AppRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      widget.values.length,
      (i) {
        return Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.values[i],
              style: const TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        );
      },
    );

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: MouseRegion(
                  cursor: !widget.isProfile
                      ? SystemMouseCursors.click
                      : MouseCursor.defer,
                  child: Listener(
                    child: Row(children: items),
                    onPointerUp: (event) {
                      if (!widget.isProfile) {
                        final body =
                            Provider.of<BodyModel>(context, listen: false);
                        body.profileId = widget.values[0];
                        body.navigate("عميل");
                      }
                    },
                  ),
                ),
              ),
              if (widget.attendBtn)
                Expanded(
                  child: AttendButton(widget.values[0]),
                ),
              if (widget.payBtn)
                Expanded(
                  child: PayButton(id: widget.values[0]),
                ),
              if (widget.cancelBtn)
                Expanded(
                  child: CancelButton(id: widget.values[0]),
                )
            ],
          ),
        ),
        const Divider(color: Colors.black)
      ],
    );
  }
}
