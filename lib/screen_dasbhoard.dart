import 'package:database_hive_app/data_hive/data_objects.dart';
import 'package:database_hive_app/data_hive/general_box.dart';
import 'package:database_hive_app/screen_add_update_record.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenDasbhoard extends StatelessWidget {
  const ScreenDasbhoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ScreenAddUpdateRecord()));
        },
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: GeneralBox.getDataObejcts().listenable(),
        builder: (context, Box<DataObejcts> box, widget) {
          if (box.values.isEmpty) {
            return Center(
              child: Text("No Data Found"),
            );
          }
          List<DataObejcts> values = box.values.toList().cast<DataObejcts>();

          return ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ScreenAddUpdateRecord(
                                  dataObejcts: values[index],
                                )));
                  },
                  title: Text(values[index].name.toString()),
                  subtitle: Text(values[index].address.toString()),
                  trailing: InkWell(
                    onTap: () {
                      box.delete(values[index].key);
                    },
                    child: Icon(Icons.delete),
                  ),
                );
              });
        },
      ),
    );
  }
}
