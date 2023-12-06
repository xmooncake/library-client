import 'package:library_client/bootstrap.dart';
import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/router.dart';

void main() {
  bootstrap(
    () => const App(
        // initialLocation: AppRouter.addPublication,
        ),
  );
}
