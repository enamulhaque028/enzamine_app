import 'package:aits_task/provider/login_provider.dart';
import 'package:aits_task/provider/registration_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
  ChangeNotifierProvider<RegistrationProvider>(create: (_) => RegistrationProvider()),
];