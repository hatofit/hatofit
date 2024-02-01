import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';

class DeviceDiscover extends StatefulWidget {
  const DeviceDiscover({super.key, required this.state});
  final NavigationState state;

  @override
  State<DeviceDiscover> createState() => _DeviceDiscoverState();
}

class _DeviceDiscoverState extends State<DeviceDiscover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.height16),
          topRight: Radius.circular(Dimens.height16),
        ),
      ),
      child: widget.state.devices!.isNotEmpty
          ? ListView.builder(
              itemCount: widget.state.devices!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(widget.state.devices![index].name),
                  subtitle: Text(widget.state.devices![index].id),
                  trailing: SizedBox(
                    width: Dimens.width140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.height16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.bluetooth_connected,
                            color: Colors.blue,
                            size: Dimens.height16,
                          ),
                          Text(
                            "Disonnect",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  onTap: () {},
                );
              },
            )
          : const Center(
              child: NoDevice(),
            ),
    );
  }
}
