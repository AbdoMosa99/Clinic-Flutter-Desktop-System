import 'package:clinic_flutter_desktop_system/components/actions/common_buttons.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final List<Client> matchingClients = [];
  late OverlayEntry _overlayEntry;
  final _focusNode = FocusNode();
  final link = LayerLink();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            width: link.leaderSize!.width,
            child: CompositedTransformFollower(
              link: link,
              offset: Offset(0.0, link.leaderSize!.height),
              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: matchingClients.map((client) {
                    return SearchItem(
                      client,
                      go: (event) {
                        matchingClients.clear();
                        final body =
                            Provider.of<BodyModel>(context, listen: false);
                        body.profileId = client.id.toString();
                        body.navigate("عميل");
                        controller.clear();
                        _focusNode.unfocus();
                        _overlayEntry.markNeedsBuild();
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BodyModel bodyModel = Provider.of<BodyModel>(context);
    List<Client> allClients = bodyModel.clients;

    void onChanged(String query) {
      setState(() {
        matchingClients.clear();
        if (query.isNotEmpty) {
          for (var client in allClients) {
            if (client.name.startsWith(query)) {
              matchingClients.add(client);
            }
          }
        }
      });
      _overlayEntry.markNeedsBuild();
    }

    return CompositedTransformTarget(
      link: link,
      child: TextField(
        focusNode: _focusNode,
        controller: controller,
        decoration: InputDecoration(
          hintText: "البحث عن عميل",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        style: const TextStyle(fontSize: 15.0),
        onChanged: onChanged,
        autocorrect: false,
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem(this.client, {this.go, super.key});

  final Client client;
  final void Function(PointerUpEvent)? go;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Listener(
                onPointerUp: go,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    client.name,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        AttendButton(client.id.toString()),
      ],
    );
  }
}
