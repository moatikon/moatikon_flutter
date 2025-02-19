import 'package:flutter/material.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_app_bar.dart';

class AddTikonScreen extends StatelessWidget {
  const AddTikonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appbar: AddTikonAppBar(),
    );
  }
}
